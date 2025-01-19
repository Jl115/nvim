-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
return {
  {
    "custom.keymaps",
    keys = {
      -- Save buffer
      { "<leader>bs", "<cmd>w<cr>", desc = "Save Buffer" },

      -- Exit insert mode with `ii`
      { "ii", "<Esc>", mode = "i", desc = "Exit Insert Mode with ii" },

      -- Remap Shift+U to redo (Ctrl+R)
      { "U", "<C-r>", mode = "n", desc = "Redo" },
    },
  },
}
