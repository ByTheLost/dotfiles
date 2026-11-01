-- Atone.nvim: Modern Neovim plugin that lets you explore and navigate your undo history as an interactive tree
-- URL: https://github.com/XXiaoA/atone.nvim

return {
  "XXiaoA/atone.nvim",
  cmd = "Atone",
  opts = {
    marks = {
      persist = true,
      persist_path = vim.fn.stdpath("data") .. "/atone_marks.json",
      finders = { "builtin" },
    },

    auto_attach = {
      enabled = true,
      excluded_ft = { "oil" },
    },
  },
}
