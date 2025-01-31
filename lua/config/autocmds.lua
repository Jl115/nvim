-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
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
  highlight InlayHint guibg=NONE ctermbg=NONE
  highlight CursorLine guibg=NONE ctermbg=NONE
]])
local lsp_inlay_hint = vim.lsp.inlay_hint

-- Temporarily disable inlay hints during save and linting
local function toggle_inlay_hints(enable)
  vim.lsp.inlay_hint = enable and lsp_inlay_hint or function() end
end

-- Autocommands for disabling inlay hints on save and linting
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    toggle_inlay_hints(false)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    toggle_inlay_hints(true)
  end,
})
