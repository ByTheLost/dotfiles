-- Comment.nvim: Fast and smart code commenting for Neovim
-- URL: https://github.com/numToStr/Comment.nvim

return {
  "folke/ts-comments.nvim",
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
  opts = {},
}
