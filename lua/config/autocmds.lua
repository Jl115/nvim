-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Set up transparency for UI elements
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

  " Additional UI elements transparency
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight CursorLineNr guibg=NONE ctermbg=NONE
  highlight FoldColumn guibg=NONE ctermbg=NONE
  highlight Folded guibg=NONE ctermbg=NONE
  
  " Floating windows transparency
  highlight FloatBorder guibg=NONE ctermbg=NONE
  highlight FloatShadow guibg=NONE ctermbg=NONE
  highlight FloatShadowThrough guibg=NONE ctermbg=NONE
  
  " Search and selection transparency

  " Message area transparency
  highlight MsgArea guibg=NONE ctermbg=NONE
  highlight MoreMsg guibg=NONE ctermbg=NONE
  highlight ErrorMsg guibg=NONE ctermbg=NONE
  highlight WarningMsg guibg=NONE ctermbg=NONE
]])
local orig_buf_set_extmark = vim.api.nvim_buf_set_extmark
vim.api.nvim_buf_set_extmark = function(buf, ns, row, col, opts)
  local ok, ret = pcall(orig_buf_set_extmark, buf, ns, row, col, opts)
  if not ok then
    return nil
  end
  return ret
end
-- Store original inlay hint function
local lsp_inlay_hint = vim.lsp.inlay_hint

-- Create autocommand group for inlay hints
local inlay_hints_group = vim.api.nvim_create_augroup("InlayHintsToggle", { clear = true })

-- Toggle function for inlay hints
local function toggle_inlay_hints(enable)
  if enable then
    local safe_inlay_hint = {}
    setmetatable(safe_inlay_hint, {
      __call = function(_, ...)
        local ok, ret = pcall(lsp_inlay_hint, ...)
        return ret
      end,
      __index = lsp_inlay_hint,
    })
    vim.lsp.inlay_hint = safe_inlay_hint
  else
    local noop = {}
    setmetatable(noop, {
      __call = function() end,
      __index = lsp_inlay_hint,
    })
    vim.lsp.inlay_hint = noop
  end
end

-- Autocommands for text changes
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  group = inlay_hints_group,
  callback = function()
    toggle_inlay_hints(false)
    vim.defer_fn(function()
      toggle_inlay_hints(true)
    end, 100)
  end,
})

-- Autocommands for file operations
vim.api.nvim_create_autocmd("BufWritePre", {
  group = inlay_hints_group,
  callback = function()
    toggle_inlay_hints(false)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = inlay_hints_group,
  callback = function()
    toggle_inlay_hints(true)
  end,
})