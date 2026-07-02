local M = {}

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

function M.setup(capabilities)
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,

    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },

        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  vim.lsp.enable("lua_ls")
  vim.lsp.enable("ts_ls")
  vim.lsp.enable("rust_analyzer")

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
  })
end

return M
