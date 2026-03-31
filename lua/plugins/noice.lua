return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = true,
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    messages = {
      enabled = true,
      view = "notify",
    },
  },
  dependencies = { "rcarriga/nvim-notify" },
}
