return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    cmd = "Neotree",

    opts = {
      filesystem = {
        bind_to_cwd = false,
        cwd = vim.fn.getcwd(),
        filtered_items = { visible = true },
        window = {
          mappings = {
            ["n"] = "add",
            ["N"] = "add_directory",
            ["r"] = "rename",
            ["d"] = "delete",
            ["q"] = "close_window",
          },
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
