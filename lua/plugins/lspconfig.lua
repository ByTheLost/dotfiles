-- return {
--   "neovim/nvim-lspconfig",
--
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--   },
--
--   config = function()
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
--     require("config.lsp").setup(capabilities)
--   end,
-- }

-- return {
--   -- LSPConfig + cmp
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--     },
--     config = function()
--       local capabilities = require("cmp_nvim_lsp").default_capabilities()
--       require("config.lsp").setup(capabilities)
--
--       -- ⚡ Configuración de diagnósticos en Neovim
--       vim.diagnostic.config({
--         virtual_text = {
--           prefix = "●",  -- Puntos pequeños para los errores
--           source = "always",  -- Mostrar la fuente del error
--         },
--         underline = false,       -- Desactiva el subrayado
--         update_in_insert = false,
--         severity_sort = true,
--         signs = true,            -- Habilita los signos a la izquierda
--         float = {
--           focusable = false,    -- No hace foco en los mensajes flotantes
--           style = "minimal",    -- Estilo minimal para el mensaje flotante
--           border = "none",      -- Sin bordes ni colores
--         },
--       })
--
--       -- Habilitar la columna de signos a la izquierda y personalizar los puntos de diagnóstico
--       vim.opt.signcolumn = "yes"  -- Asegura que la columna de signos esté activa
--
--       -- Definir los signos para los diagnósticos
--       local signs = { Error = "●", Warn = "●", Info = "●", Hint = "●" }
--       for type, icon in pairs(signs) do
--         local hl = "Diagnostic" .. type
--         vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = hl, numhl = "" })
--       end
--
--       -- Cambiar la apariencia de los mensajes de diagnóstico para que no tengan fondo
--       vim.cmd("highlight DiagnosticError guifg=#ff0000 guibg=NONE")
--       vim.cmd("highlight DiagnosticWarn guifg=#ffcc00 guibg=NONE")
--       vim.cmd("highlight DiagnosticInfo guifg=#00ff00 guibg=NONE")
--       vim.cmd("highlight DiagnosticHint guifg=#00ffff guibg=NONE")
--     end,
--   },
--
--   -- ⚡ tiny-inline-diagnostic.nvim (opcional)
--   {
--     "rachartier/tiny-inline-diagnostic.nvim",
--     event = "VeryLazy",
--     config = function()
--       require("tiny-inline-diagnostic").setup({
--         preset = "modern",
--         transparent_bg = true,  -- Fondo transparente para no interferir con el fondo
--         transparent_cursorline = true,
--         hi = {
--           error = "DiagnosticError",
--           warn = "DiagnosticWarn",
--           info = "DiagnosticInfo",
--           hint = "DiagnosticHint",
--           arrow = "NonText",
--           background = "NONE",  -- Sin fondo en el área de diagnóstico
--           mixing_color = "Normal",
--         },
--         options = {
--           show_source = { enabled = false, if_many = false },
--           show_code = true,
--           use_icons_from_diagnostic = false,
--           set_arrow_to_diag_color = false,
--           throttle = 20,
--           softwrap = 30,
--           add_messages = { messages = true, display_count = false, use_max_severity = false },
--           multilines = { enabled = false, always_show = false, trim_whitespaces = false, tabstop = 4 },
--           show_all_diags_on_cursorline = false,
--           show_diags_only_under_cursor = false,
--           show_related = { enabled = true, max_count = 3 },
--           enable_on_insert = false,
--           enable_on_select = false,
--           overflow = { mode = "wrap", padding = 0 },
--           break_line = { enabled = false, after = 30 },
--           virt_texts = { priority = 2048 },
--           severity = {
--             vim.diagnostic.severity.ERROR,
--             vim.diagnostic.severity.WARN,
--             vim.diagnostic.severity.INFO,
--             vim.diagnostic.severity.HINT,
--           },
--         },
--       })
--
--       vim.diagnostic.config({
--         virtual_text = false,  -- Asegura que virtual_text esté habilitado
--         signs = true,          -- Habilita los signos a la izquierda
--         float = { focusable = false },  -- Desactiva la flotante duplicada
--       })
--     end,
--   },
-- }

return {
  -- LSPConfig + cmp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("config.lsp").setup(capabilities)

      -- ⚡ Configuración de diagnósticos en Neovim
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",  -- Puntos pequeños para los errores
          source = "always",  -- Mostrar la fuente del error
        },
        underline = false,       -- Desactiva el subrayado
        update_in_insert = false,
        severity_sort = true,
        signs = true,            -- Habilita los signos a la izquierda
        float = {
          focusable = false,    -- No hace foco en los mensajes flotantes
          style = "minimal",    -- Estilo minimal para el mensaje flotante
          border = "none",      -- Sin bordes ni colores
        },
      })

      -- Habilitar la columna de signos a la izquierda y personalizar los puntos de diagnóstico
      vim.opt.signcolumn = "yes"  -- Asegura que la columna de signos esté activa

      -- Configuración de los signos para los diagnósticos directamente en vim.diagnostic.config()
      vim.diagnostic.config({
        signs = {
          Error = { text = "●", texthl = "DiagnosticError" },
          Warn  = { text = "●", texthl = "DiagnosticWarn" },
          Info  = { text = "●", texthl = "DiagnosticInfo" },
          Hint  = { text = "●", texthl = "DiagnosticHint" },
        }
      })

      -- Cambiar la apariencia de los mensajes de diagnóstico para que no tengan fondo
      vim.cmd("highlight DiagnosticError guifg=#ff0000 guibg=NONE")
      vim.cmd("highlight DiagnosticWarn guifg=#ffcc00 guibg=NONE")
      vim.cmd("highlight DiagnosticInfo guifg=#00ff00 guibg=NONE")
      vim.cmd("highlight DiagnosticHint guifg=#00ffff guibg=NONE")
    end,
  },

  -- ⚡ tiny-inline-diagnostic.nvim (opcional)
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        transparent_bg = true,  -- Fondo transparente para no interferir con el fondo
        transparent_cursorline = true,
        hi = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
          arrow = "NonText",
          background = "NONE",  -- Sin fondo en el área de diagnóstico
          mixing_color = "Normal",
        },
        options = {
          show_source = { enabled = false, if_many = false },
          show_code = true,
          use_icons_from_diagnostic = false,
          set_arrow_to_diag_color = false,
          throttle = 20,
          softwrap = 30,
          add_messages = { messages = true, display_count = false, use_max_severity = false },
          multilines = { enabled = false, always_show = false, trim_whitespaces = false, tabstop = 4 },
          show_all_diags_on_cursorline = false,
          show_diags_only_under_cursor = false,
          show_related = { enabled = true, max_count = 3 },
          enable_on_insert = false,
          enable_on_select = false,
          overflow = { mode = "wrap", padding = 0 },
          break_line = { enabled = false, after = 30 },
          virt_texts = { priority = 2048 },
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = false,  -- Asegura que virtual_text esté habilitado
        signs = true,          -- Habilita los signos a la izquierda
        float = { focusable = false },  -- Desactiva la flotante duplicada
      })
    end,
  },
}
