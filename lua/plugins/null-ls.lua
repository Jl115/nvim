return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = opts.sources or {}
    vim.list_extend(opts.sources, {
      -- Prettier for formatting
      null_ls.builtins.formatting.prettier.with({
        extra_args = function(params)
          local util = require("lspconfig.util")
          local config = util.search_ancestors(params.bufname, function(dir)
            if vim.fn.filereadable(dir .. "/.prettierrc") == 1 then
              return dir .. "/.prettierrc"
            elseif vim.fn.filereadable(dir .. "/prettier.config.js") == 1 then
              return dir .. "/prettier.config.js"
            end
          end)
          if config then
            return { "--config", config }
          end
          return {}
        end,
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