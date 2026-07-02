-- config/autocmds.lua

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = function()
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "StatusLine", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "NONE", bg = "NONE" })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "typescript",
    "tsx",
    "jsx",
    "lua",
    "python",
    "html",
    "css",
    "json",
    "bash",
  },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = "#bd93f9" })
    vim.api.nvim_set_hl(0, "NavicIconsMethod", { fg = "#8be9fd" })
    vim.api.nvim_set_hl(0, "NavicIconsClass", { fg = "#ff79c6" })
    vim.api.nvim_set_hl(0, "NavicIconsVariable", { fg = "#50fa7b" })

    vim.api.nvim_set_hl(0, "NavicText", { fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "NavicSeparator", { fg = "#6272a4" })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "snacks_dashboard" then
      vim.b[args.buf].miniindentscope_disable = true
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "neo-tree",
    "oil_preview",
    "help",
    "lazy",
    "mason",
    "snacks_dashboard",
  },
  callback = function(args)
    vim.b[args.buf].miniindentscope_disable = true

    if vim.bo[args.buf].filetype == "snacks_dashboard" then
      vim.opt.showtabline = 0
      vim.opt.laststatus = 0

      vim.api.nvim_set_hl(0, "StatusLine", {
        bg = "NONE",
      })

      vim.api.nvim_set_hl(0, "StatusLineNC", {
        bg = "NONE",
      })
    end
  end,
})

local function is_float(win)
  return vim.api.nvim_win_get_config(win).relative ~= ""
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  callback = function()
    local win = vim.api.nvim_get_current_win()

    if is_float(win) then
      vim.wo.statusline = ""
    else
      vim.wo.statusline = nil
    end
  end,
})
