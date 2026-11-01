return {
  "williamboman/mason.nvim",
  lazy = true,
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUpdate",
    "MasonUninstall",
  },
  opts = {
    ui = {
      border = "rounded",
    },
  },
}
