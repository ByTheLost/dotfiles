local capabilities = require("config.capabilities").capabilities()

local servers = {
  lua = "lua_ls",
  javascript = "ts_ls",
  typescript = "ts_ls",
  rust = "rust_analyzer",
  python = "pyright",
  go = "gopls",
  c = "clangd",
  cpp = "clangd",
  html = "html-lsp",
  css = "css-lsp",
  json = "json-lsp",
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local server = servers[ft]

    if server then
      vim.lsp.config(server, {
        capabilities = capabilities,
      })

      vim.lsp.enable(server)
    end
  end,
})
