return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Not strictly required, but recommended
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = "open_default",
    },
    window = {
      close_on_open = true,
    },
    event_handlers = {
      {
        event = "neo_tree_node_change",
        handler = function(state)
          if state.node and state.node.type == "file" then
            require("neo-tree").execute({
              action = "toggle_preview",
              config = { use_float = true, use_image_nvim = true },
            })
          end
        end,
      },
      {
        event = "file_opened",
        handler = function()
          require("neo-tree").close_all()
        end,
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- Ensure folders can always expand
      },
    },
    root = vim.fn.getcwd(), -- Set root to the current working directory
  },
}
