local theme = require("config.themes")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd.colorscheme(theme.colorscheme)
  end,
})
