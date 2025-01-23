return {

  {
    "tribela/transparent.nvim",
    event = "VimEnter",
    config = function()
      require("transparent").setup({
        auto = true,
        extra_groups = {
          "NormalFloat",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "NeoTreeWinSeparator",
          "NeoTreeTitleBar",
          "NeoTreeTabActive",
          "NeoTreeTabInactive",
          "NeoTreeTabSeparatorActive",
          "NeoTreeTabSeparatorInactive",
          "LazyNormal",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptNormal",
          "TelescopePromptBorder",
          "TelescopeResultsNormal",
          "TelescopeResultsBorder",
          "TelescopePreviewNormal",
          "TelescopePreviewBorder",
          "Pmenu",
          "PmenuSel",
          "StatusLine",
          "StatusLineNC",
          "VertSplit",
          "WinSeparator",
        },
        excludes = {},
      })
    end,
  },
}
