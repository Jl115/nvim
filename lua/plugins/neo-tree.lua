return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    cmd = "Neotree",
    opts = {
      filesystem = { -- Show the opened file in the file explorer
        bind_to_cwd = false, -- Prevent Neo-tree from changing directories automatically
        cwd = vim.fn.getcwd(), -- Start Neo-tree in the directory where Neovim was opened
        filtered_items = {
          visible = true, -- Show hidden files (toggle with `H`)
        },
        window = {
          mappings = {
            ["n"] = "add", -- New file
            ["N"] = "add_directory", -- New folder
            ["r"] = "rename", -- Rename
            ["d"] = "delete", -- Delete
            ["q"] = "close_window", -- Close Neo-tree
          },
        },
      },
    },
  },
}
