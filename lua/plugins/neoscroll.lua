return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      local neoscroll = require("neoscroll")

      neoscroll.setup({
        easing_function = "cubic", -- Ultra-smooth acceleration
        hide_cursor = false,
        stop_eof = true, -- Prevent scrolling past the last line
        use_local_scrolloff = true,
        respect_scrolloff = true, -- Keeps cursor away from the edges
        cursor_scrolls_alone = true, -- Makes scrolling more fluid
      })
    end,
  },
}
