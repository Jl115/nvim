-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local ls = require("luasnip")
local set = vim.keymap.set

-- Save buffer
vim.keymap.set("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save Buffer" })

-- Exit insert mode with `ii`
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode with ii" })

-- Remap Shift+U to redo (Ctrl+R)
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

local last_buffer = nil -- Store the last active buffer

vim.keymap.set("n", "<leader>t", function()
  local win_list = vim.api.nvim_list_wins()
  local neotree_win = nil
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)

  -- Check if Neo-tree is open in any window
  for _, win in ipairs(win_list) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)
    if bufname:match("neo%-tree") then
      neotree_win = win
      break
    end
  end

  if neotree_win then
    if current_win == neotree_win then
      -- If already focused on Neo-tree, switch back to last buffer
      if last_buffer and vim.api.nvim_buf_is_valid(last_buffer) then
        vim.api.nvim_set_current_buf(last_buffer)
      end
    else
      -- Store the last buffer and switch to Neo-tree
      last_buffer = current_buf
      vim.api.nvim_set_current_win(neotree_win)
    end
  else
    -- Store the last buffer and open Neo-tree
    last_buffer = current_buf
    vim.cmd("Neotree toggle")
  end
end, { desc = "Open or Focus Neo-tree, Return to Last Buffer" })
local neoscroll = require("neoscroll")

vim.keymap.set("n", "j", function()
  neoscroll.scroll(1, true, 10)
end, { desc = "Smooth Down" })
vim.keymap.set("n", "k", function()
  neoscroll.scroll(-1, true, 10)
end, { desc = "Smooth Up" })

vim.keymap.set({ "i" }, "<C-K>", function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
-- Switch to buffer 1-9 with CTRL+1 to CTRL+9
for i = 1, 9 do
  vim.keymap.set("n", "<C-" .. i .. ">", ":buffer " .. i .. "<CR>", { noremap = true, silent = true })
end

-- Close all buffers except the current one with CTRL+R
vim.keymap.set("n", "<C-r>", ":%bd|e#|bd#<CR>", { noremap = true, silent = true })
