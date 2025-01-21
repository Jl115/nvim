return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true, -- Enable transparency
      integrations = {
        neotree = {
          enabled = true,
          show_root = true,
          transparent_panel = true, -- Make Neo-tree transparent
        },
        lualine = true,
        treesitter = true,
        telescope = true,
        notify = true,
        which_key = true,
      },
    },
  },
}
