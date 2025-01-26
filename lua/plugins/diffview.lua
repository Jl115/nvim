return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy", -- Load when needed
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true, -- Optional: improves diff highlighting
      })
    end,
  },
}
