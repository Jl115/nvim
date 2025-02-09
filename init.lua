-- bootstrap lazy.nvim, LazyVim and your plugins
--
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

require("config.lazy")
