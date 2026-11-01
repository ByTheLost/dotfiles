-- config/autocmds.lua

-- Store originals for dashboard restore
local dashboard_originals = {}

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
    if vim.bo[args.buf].filetype == "snacks_dashboard" then
      -- Save originals before modifying
      dashboard_originals.showtabline = vim.opt.showtabline:get()
      dashboard_originals.StatusLine = vim.api.nvim_get_hl(0, { name = "StatusLine" })
      dashboard_originals.StatusLineNC = vim.api.nvim_get_hl(0, { name = "StatusLineNC" })

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

-- Restore settings when leaving dashboard
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    if vim.bo.filetype ~= "snacks_dashboard" and dashboard_originals.showtabline then
      vim.opt.showtabline = dashboard_originals.showtabline
      vim.api.nvim_set_hl(0, "StatusLine", dashboard_originals.StatusLine)
      vim.api.nvim_set_hl(0, "StatusLineNC", dashboard_originals.StatusLineNC)
      dashboard_originals = {}
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
-- vim.api.nvim_create_autocmd("VimEnter", {
--   once = true,
--   callback = function()
--     vim.defer_fn(function()
--       local ok, status = pcall(require, "lazy.status")
--       if not ok then return end
--
--       if status.has_updates() then
--         local count = tonumber(status.updates()) or 0
--         local msg = count == 1
--             and "1 plugin update available"
--             or count .. " plugin updates available"
--         vim.notify(msg, vim.log.levels.INFO, { title = "Plugin Updates" })
--       end
--     end, 3000)
--   end,
-- })

-- Show Lazy UI automatically when plugin updates are available
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
