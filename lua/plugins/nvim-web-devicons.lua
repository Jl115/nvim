return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- Load only when required
    opts = {
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh",
        },
      },
      color_icons = true, -- Enable different highlight colors per icon
      default = true, -- Enable default icons
      strict = true, -- Enforce strict icon selection
    },
    config = function()
      require("nvim-web-devicons").setup({
        -- Optional custom overrides
      })
    end,
  },
}
