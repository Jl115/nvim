return {

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
      "hrsh7th/cmp-buffer", -- Buffer completions
      "hrsh7th/cmp-path", -- Path completions
    },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.mapping = cmp.mapping.preset.insert({
        -- Navigate completion menu using Arrow Keys
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),

        -- Navigate within snippet placeholders using Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Navigate completion menu
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump() -- Jump forward within snippet
          elseif has_words_before() then
            cmp.complete() -- Trigger completion menu
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Navigate completion menu backwards
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1) -- Jump backwards within snippet
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Select an item in the completion menu using Enter
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })
    end,
  },
}
