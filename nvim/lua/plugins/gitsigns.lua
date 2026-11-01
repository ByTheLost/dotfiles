return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",

  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },

    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 500,
    },

    watch_gitdir = {
      follow_files = true,
    },

    attach_to_untracked = true,
  },

  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
