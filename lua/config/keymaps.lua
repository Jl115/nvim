-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Save buffer
vim.keymap.set("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save Buffer" })

-- Exit insert mode with `ii`
vim.keymap.set("i", "ii", "<Esc>", { desc = "Exit Insert Mode with ii" })

-- Remap Shift+U to redo (Ctrl+R)
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

vim.keymap.set("n", "<leader>t", function()
  local is_neotree_open = vim.fn.bufname("%"):match("neo%-tree")
  if is_neotree_open then
    vim.cmd("wincmd p") -- Go back to the last active buffer
  else
    vim.cmd("Neotree focus") -- Open Neo-tree and focus it
  end
end, { desc = "Toggle Focus Neo-tree" })
