return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",

  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "modern",
      transparent_bg = true,

      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
      },

      options = {
        show_code = true,
        show_source = { enabled = false },
        enable_on_insert = false,
        show_related = { enabled = true, max_count = 3 },
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },
      },
    })
  end,
}
