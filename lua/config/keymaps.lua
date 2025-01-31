-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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
