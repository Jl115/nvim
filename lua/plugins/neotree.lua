return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  opts = {
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
  },
}
