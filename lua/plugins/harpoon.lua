return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true, -- Auto-save when toggling menu
        sync_on_ui_close = true, -- Sync list when closing UI
      },
    })

    -- Keybindings
    local set = vim.keymap.set

    set("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Harpoon Add File" })
    set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Menu" })
    set("n", "<leader>X", function()
      harpoon:list():clear()
    end, { desc = "Clear Harpoon Marks" })

    -- Quick navigation
    set("n", "<M-1>", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to File 1" })
    set("n", "<M-2>", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon to File 2" })
    set("n", "<M-3>", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon to File 3" })
    set("n", "<M-4>", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon to File 4" })

    -- Cycle through files
    set("n", "<C-n>", function()
      harpoon:list():next()
    end, { desc = "Harpoon Next File" })
    set("n", "<C-p>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon Previous File" })
  end,
}
