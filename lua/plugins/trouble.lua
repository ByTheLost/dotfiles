return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  cmd = "Trouble",

  opts = {
    focus = true,
    auto_preview = true,
    use_diagnostic_signs = true,

    modes = {
      diagnostics = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.5,
        },
      },

      symbols = {
        mode = "lsp_document_symbols",
        focus = true,
        preview = {
          type = "float",
          border = "rounded",
          size = { width = 0.6, height = 0.8 },
        },
      },

      lsp = {
        mode = "lsp",
        preview = {
          type = "split",
          position = "right",
          size = 0.5,
        },
      },
    },
  },

  keys = {
    {
      "<leader>xx",
      function()
        require("trouble").toggle("diagnostics")
      end,
      desc = "Diagnostics (Trouble)",
    },

    {
      "<leader>xw",
      function()
        require("trouble").toggle("diagnostics", { filter = { buf = 0 } })
      end,
      desc = "Buffer diagnostics",
    },

    {
      "<leader>cs",
      function()
        require("trouble").toggle("lsp_document_symbols")
      end,
      desc = "Symbols",
    },

    {
      "<leader>cl",
      function()
        require("trouble").toggle("lsp")
      end,
      desc = "LSP",
    },
  },
}
