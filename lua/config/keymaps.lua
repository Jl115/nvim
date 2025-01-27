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
-- Use `b1` to `b9` for buffer switching
-- Use `b1` to `b9` for buffer switching (starting from 1)
for i = 1, 9 do
  vim.keymap.set(
    "n",
    "b" .. i,
    ":buffer " .. i .. "<CR>",
    { noremap = true, silent = true, desc = "Switch to Buffer " .. i }
  )
end
-- Close all buffers except the current one with CTRL+R
vim.keymap.set("n", "<C-r>", ":%bd|e#|bd#<CR>", { noremap = true, silent = true })
