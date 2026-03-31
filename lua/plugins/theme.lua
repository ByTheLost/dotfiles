return {
  "Mofiqul/dracula.nvim",
  priority = 1000,
  config = function()
    require("dracula").setup({
      transparent_bg = true,
    })

    vim.cmd.colorscheme("dracula")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#bd93f9" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#bd93f9", bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700", bold = true })
  end,
}
