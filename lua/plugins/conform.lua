return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },

  cmd = "ConformInfo",

  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          timeout_ms = 3000,
          lsp_format = "fallback",
        })
      end,
      mode = { "n", "x" },
      desc = "Format file",
    },

    {
      "<leader>cF",
      function()
        require("conform").format({
          formatters = { "injected" },
          timeout_ms = 3000,
        })
      end,
      mode = { "n", "x" },
      desc = "Format injected langs",
    },
  },

  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
      lsp_format = "fallback",
    },

    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      json = { "prettier" },
      sh = { "shfmt" },
      fish = { "fish_indent" },
    },

    format_on_save = function(bufnr)
      return {
        timeout_ms = 2000,
        lsp_format = "fallback",
      }
    end,

    formatters = {
      injected = {
        options = {
          ignore_errors = true,
        },
      },
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
