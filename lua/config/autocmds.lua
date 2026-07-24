-- config/autocmds.lua

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
      vim.opt_local.laststatus = 0
      vim.opt_local.statuscolumn = ""

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

-- Plugin update notification on startup (via snacks.nvim)
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      local ok, status = pcall(require, "lazy.status")
      if not ok then return end

      if status.has_updates() then
        local checker = require("lazy.manage.checker")
        local count = #checker.updated
        local header = count == 1
            and "1 plugin update available:"
            or count .. " plugin updates available:"

        local lines = { header }
        for _, name in ipairs(checker.updated) do
          table.insert(lines, "  • " .. name)
        end
        local msg = table.concat(lines, "\n")
        vim.notify(msg, vim.log.levels.INFO, { title = "Plugin Updates" })
      end
    end, 3000)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
