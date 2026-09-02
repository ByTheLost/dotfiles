-- Lualine.nvim: A fast and customizable statusline plugin for Neovim that provides clear, lightweight, and extensible UI components
-- URL: https://github.com/nvim-lualine/lualine.nvim

local theme = require("config.themes")

local lualine_theme = require("config.lualine_theme").get(theme.colorscheme)

-- =========================
-- MODE (más limpio)
-- =========================
local function get_mode()
  local mode_map = {
    n = "󰋜 NORMAL",
    i = "󰏫 INSERT",
    v = "󰈈 VISUAL",
    V = "󰈈 V-LINE",
    ["\22"] = "󰈈 V-BLOCK",
    c = "󰘳 COMMAND",
    R = "󰑕 REPLACE",
    t = "󰆍 TERMINAL",
  }

  local mode = vim.fn.mode()
  return mode_map[mode] or mode
end

-- =========================
-- OIL PATH (mejorado)
-- =========================
local function oil_path()
  local ok, oil = pcall(require, "oil")
  if not ok then return "" end

  local path = oil.get_current_dir()
  if not path then return "oil: (no dir)" end

  return "󰝰 " .. vim.fn.fnamemodify(path, ":~")
end

-- =========================
-- FILE INFO (cached size)
-- =========================
local cached_size = 0

local function update_size()
  local path = vim.fn.expand("%:p")
  if path == "" then
    cached_size = 0
    return
  end
  local size = vim.fn.getfsize(path)
  cached_size = size > 0 and size or 0
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = update_size,
})

local function file_info()
  local filename = vim.fn.expand("%:t")
  if filename == "" then return " No File" end

  local kb = math.floor(cached_size / 1024)

  local ok, devicons = pcall(require, "nvim-web-devicons")

  local icon = ""
  if ok then
    icon = devicons.get_icon(filename, vim.fn.expand("%:e"), { default = true }) or ""
  end

  return string.format("%s %s  •  %dKB", icon, filename, kb)
end

-- =========================
-- LSP STATUS (nuevo)
-- =========================
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return "󰒲 No LSP"
  end

  return "󰒋 LSP " .. #clients
end

-- =========================
-- GIT BRANCH (bonito)
-- =========================
local function git_branch()
  local branch = vim.b.gitsigns_head or vim.b.git_branch
  if not branch or branch == "" then return "" end

  return " " .. branch
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    options = {
      theme = lualine_theme,
      icons_enabled = true,
      globalstatus = true,
      always_show_tabline = false,

      component_separators = {
        left = "",
        right = "",
      },

      section_separators = {
        left = "",
        right = "",
      },

      disabled_filetypes = {
        statusline = { "snacks_dashboard", "neo-tree", "atone" },
      },
    },

    sections = {
      -- LEFT
      lualine_a = { get_mode },

      lualine_b = {
        {
          git_branch,
          color = { fg = "#ff5555", gui = "bold" },
        },
        {
          file_info,
          color = { fg = "#16EDF5", gui = "italic" },
        },
      },

      lualine_c = {
        lsp_status,
      },

      -- RIGHT
      lualine_x = {
        "diff",
        "diagnostics",
        "encoding",
        "fileformat",
        "filetype",
      },

      lualine_y = {
        "progress",
      },

      lualine_z = {
        "location",
      },
    },

    extensions = {
      "quickfix",

      {
        filetypes = { "oil" },
        sections = {
          lualine_a = { get_mode },
          lualine_b = { oil_path },
        },
      },

      {
        filetypes = { "codecompanion" },
        sections = {
          lualine_a = {
            function() return "󰚩 CODE" end,
          },
          lualine_b = {
            function()
              return vim.g.codecompanion_adapter_name or ""
            end,
          },
          lualine_c = {
            function()
              return vim.g.codecompanion_current_model_name or ""
            end,
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      },
    },
  },
}
