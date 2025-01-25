return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Use the latest v2 release
    build = "make install_jsregexp", -- Optional: Installs regex support
    dependencies = {
      "rafamadriz/friendly-snippets", -- Optional: Predefined snippets
    },
    config = function()
      local luasnip = require("luasnip")

      -- Load VSCode-like snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Keybindings for snippet navigation
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set("i", "<CR>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          return "<CR>"
        end
      end, { expr = true, silent = true })
    end,
  },
}
