local M = {}

M.capabilities = function()
  local caps = vim.lsp.protocol.make_client_capabilities()

  local ok, blink = pcall(require, "blink.cmp")
  if ok then
    caps = blink.get_lsp_capabilities(caps)
  end

  return caps
end

return M
