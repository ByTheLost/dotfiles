return {
  "j-hui/fidget.nvim",
  event = "LspAttach",

  opts = {
    progress = {
      display = {
        done_ttl = 2,
      },
    },

    notification = {
      override_vim_notify = false,
      window = {
        border = "rounded",
      },
    },
  },
}
