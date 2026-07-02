return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
      tab_char = "▏",
    },

    exclude = {
      filetypes = {
        "Trouble",
        "alpha",
        "dashboard",
        "starter",
        "snacks_dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "TelescopePromptePrompt",
        "toggleterm",
        "trouble",
        "oil",
      },
      buftypes = { "terminal" },
    },
    whitespace = {
      highlight = { "NonText" },
    },
    scope = {
      enabled = false,
    },
  },
}
