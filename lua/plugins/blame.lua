return {
  "APZelos/blamer.nvim",
  config = function()
    vim.g.blamer_enabled = 1 -- Always show blame
    vim.g.blamer_delay = 500 -- Delay before showing blame (ms)
  end,
}
