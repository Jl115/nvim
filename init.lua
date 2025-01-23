-- Bootstrap Lazy.nvim, LazyVim and plugins
require("config.lazy")

-- Load LuaSnip snippets from VSCode-style files
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

-- Safe require for `nvim-cmp`
local ok, cmp = pcall(require, "cmp")
if not ok then
  print("nvim-cmp not found! Run :Lazysync")
  return
end

local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- Move up
    ["<C-j>"] = cmp.mapping.select_next_item(), -- Move down
    ["<Down>"] = cmp.mapping.select_next_item(), -- Move down (arrow)
    ["<Up>"] = cmp.mapping.select_prev_item(), -- Move up (arrow)
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Insert with Enter
  },

  sources = {
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})
-- make background transparent
vim.cmd([[
  " General UI transparency
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE

  " NeoTree transparency
  highlight NeoTreeNormal guibg=NONE ctermbg=NONE
  highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
  highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
  highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE
  highlight NeoTreeTitleBar guibg=NONE ctermbg=NONE
  highlight NeoTreeTabActive guibg=NONE ctermbg=NONE
  highlight NeoTreeTabInactive guibg=NONE ctermbg=NONE
  highlight NeoTreeTabSeparatorActive guibg=NONE ctermbg=NONE
  highlight NeoTreeTabSeparatorInactive guibg=NONE ctermbg=NONE

  " Telescope transparency
  highlight TelescopeNormal guibg=NONE ctermbg=NONE
  highlight TelescopeBorder guibg=NONE ctermbg=NONE
  highlight TelescopePromptNormal guibg=NONE ctermbg=NONE
  highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
  highlight TelescopeResultsNormal guibg=NONE ctermbg=NONE
  highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
  highlight TelescopePreviewNormal guibg=NONE ctermbg=NONE
  highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE

  " Lualine & StatusLine transparency
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight StatusLineNC guibg=NONE ctermbg=NONE
  highlight WinSeparator guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE

  " Popup menu transparency
  highlight Pmenu guibg=NONE ctermbg=NONE
  highlight PmenuSel guibg=NONE ctermbg=NONE
]])
