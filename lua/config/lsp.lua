local M = {}

function M.setup(capabilities)
  -- Lua
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
  })

  -- TypeScript
  vim.lsp.config("tsserver", {
    capabilities = capabilities,
  })

  -- Activar servidores
  vim.lsp.enable("lua_ls")
  vim.lsp.enable("tsserver")
end

return M
