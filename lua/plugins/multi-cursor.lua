return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    local set = vim.keymap.set

    -- Add cursor to next matching word
    set({ "n", "v" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end)

    -- Add cursor one line down
    set({ "n", "v" }, "<leader>k", function()
      mc.lineAddCursor(1)
    end)

    -- Add cursor one line up
    set({ "n", "v" }, "<leader>j", function()
      mc.lineAddCursor(-1)
    end)

    -- Remove all cursors
    set({ "n", "v" }, "<leader>x", mc.clearCursors)
  end,
}
