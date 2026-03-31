return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,

    skip_confirm_for_simple_edits = false,

    view_options = {
      show_hidden = true,
    },

    columns = {
      "icon",
    },

    float = {
      preview_split = "right",
      padding = 2,
      max_width = 100,
      max_height = 30,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },

    previw_win = {
      preview_method = "fast_scratch",
      update_on_cursor_moved = true,
    },

    confirmation = {
      border = "rounded",
      max_width = 0.9,
      min_width = { 40, 0.4 },
      max_height = 0.9,
      min_height = { 5, 0.1 },
      win_options = { winblend = 0 },
    },

    progress = {
      border = "rounded",
      max_width = 0.9,
      min_width = { 40, 0.4 },
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      win_options = { winblend = 0 },
    },

    keymaps = {
      ["q"] = "actions.close",
      ["<leader>o"] = "actions.select",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
