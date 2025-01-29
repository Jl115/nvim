if true then
  return {}
end
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      auto_install = true,
      inline_hints = true,
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        settings = {
          tsserver = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enable = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        settings = {
          eslint = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enable = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      })
      lspconfig.ast_grep.setup({
        capabilities = capabilities,
        settings = {
          ast_grep = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enable = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      })
      lspconfig.vuels.setup({
        capabilities = capabilities,
        settings = {
          vuels = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enable = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
