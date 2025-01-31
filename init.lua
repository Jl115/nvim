-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
