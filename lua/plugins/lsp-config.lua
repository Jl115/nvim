return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
    opts = {
      servers = {
        pyright = {},
        lua_ls = {},
        tsserver = {},
        dartls = {},
        rust_analyzer = {},
      },
      setup = {
        tsserver = function(_, opts)
          -- 1. Setup typescript.nvim FIRST
          require("typescript").setup({ server = opts })

          -- 2. THEN, modify the opts (especially root_dir)
          local util = require("lspconfig.util")
          opts.root_dir = function(fname)
            local js_root = util.search_ancestors(fname, function(dir)
              if vim.fn.filereadable(dir .. "/jsconfig.json") == 1 then
                return dir
              end
            end)
            if js_root then
              return js_root
            end
            return util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
          end

          -- 3. No need to return true; nvim-lspconfig will handle it.
        end,
      },
      on_attach = function(client, buffer) -- Add client argument
        -- ... (Your keybindings and logging from the previous example)

        if client.name == "tsserver" then
          -- stylua: ignore
          vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.api.nvim_buf_set_keymap(
            buffer,
            "n",
            "<leader>cR",
            "TypescriptRenameFile",
            { buffer = buffer, desc = "Rename File" }
          )
        end
      end,
    },
  },
}
