return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  -- lazy = false,

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local capabilities =
      require("config.capabilities").capabilities()

    require("config.lsp").setup(capabilities)

    require("config.lsp_autostart")

    vim.diagnostic.config({
      virtual_text = false,
      -- virtual_text = {
      --   prefix = "●",
      --   spacing = 2,
      -- },
      underline = true,
      update_in_insert = false,
      severity_sort = true,

      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "", -- 
          [vim.diagnostic.severity.WARN]  = "", -- 
          [vim.diagnostic.severity.INFO]  = "", -- 
          [vim.diagnostic.severity.HINT]  = "", -- 
        },
      },
    })

    -- vim.opt.signcolumn = "yes"
  end,
}
