-- lua/plugins/mason-lspconfig.lua
-- Uses mason-lspconfig native handlers for zero-duplication LSP setup

return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason.nvim" },

  opts = {
    ensure_installed = {
      "lua_ls",
      "ts_ls",
      "rust_analyzer",
      "pyright",
      "gopls",
      "clangd",
      "html",
      "cssls",
      "jsonls",
      "bashls",
      "yamlls",
      "dockerls",
      "marksman",
      "sqls",
    },
    automatic_installation = true,

    -- Default handler for all servers — lsp_setup._configure_server handles everything
    handlers = {
      function(server_name)
        require("config.lsp_setup")._configure_server(server_name)
      end,
    },
  },

  config = function(_, opts)
    -- lazy.nvim auto-calls setup(opts), but we need to ensure it runs
    -- with our handlers. The opts.handlers above will be used.
    require("mason-lspconfig").setup(opts)
  end,
}
