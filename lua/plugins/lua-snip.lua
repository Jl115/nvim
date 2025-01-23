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

      -- Load SnipMate-like snippets (if needed)
      -- require("luasnip.loaders.from_snipmate").lazy_load()

      -- Keybindings for snippet navigation
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        luasnip.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        luasnip.jump(-1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true })
    end,
  },
}
