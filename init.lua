-- Leader
vim.g.mapleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  ui = {
    border = "rounded"
  },
})
