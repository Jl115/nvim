return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = opts.sources or {}
    vim.list_extend(opts.sources, {
      -- Prettier for formatting
      null_ls.builtins.formatting.prettier.with({
        condition = function(utils)
          return utils.root_has_file(".prettierrc") or utils.root_has_file("prettier.config.js")
        end,
      }),
      -- ESLint for linting and code actions
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
    })
  end,
}
