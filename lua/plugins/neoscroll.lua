return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        easing_function = "cubic", -- Ultra-smooth acceleration
        hide_cursor = false,
        stop_eof = true, -- Prevent scrolling past the last line
        use_local_scrolloff = true,
        respect_scrolloff = true, -- Keeps cursor away from the edges
        cursor_scrolls_alone = true, -- Makes scrolling more fluid
      })

      -- Set global scrolloff to prevent overscrolling
      vim.opt.scrolloff = 0 -- Ensures you cannot scroll past the top/bottom
    end,
  },
}
