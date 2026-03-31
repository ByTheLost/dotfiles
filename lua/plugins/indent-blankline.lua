return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    exclude = {
      filetypes = {
        "help",
        "lazy",
        "neo-tree",
        "TelescopePrompt",
        "toggleterm",
        "Trouble",
        "oil"
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
