return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    -- Initialize unified LSP setup (configures all servers, diagnostics, keymaps)
    require("config.lsp_setup").setup()

    -- mason-lspconfig handlers are configured in its own plugin spec
    -- They will auto-configure servers as they're installed
  end,
}
