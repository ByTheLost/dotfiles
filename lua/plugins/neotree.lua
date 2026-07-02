return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  opts = {
    close_if_last_window = true,

    filesystem = {
      filtered_items = {
        visible = true,
      },
    },

    window = {
      position = "left",
      width = 30,
    },

    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
      },
    },
  },
}
