-- lua/config/lsp_setup.lua
-- Single source of truth for LSP configuration (nvim 0.11+ vim.lsp.config API)
-- Replaces lsp.lua + lsp_autostart.lua

local M = {}

local configured = {}

-- ============================================
-- CAPABILITIES (from blink.cmp)
-- ============================================
local function capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()
  local ok, blink = pcall(require, "blink.cmp")
  if ok then
    caps = blink.get_lsp_capabilities(caps)
  end
  return caps
end

-- ============================================
-- SERVER-SPECIFIC SETTINGS
-- ============================================
local server_settings = {
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        diagnostics = { globals = { "vim" } },
        telemetry = { enable = false },
        hint = { enable = true },
      },
    },
  },

  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = { command = "clippy" },
        inlayHints = {
          bindingModeHints = { enable = true },
          closureReturnTypeHints = { enable = true },
          lifetimeElisionHints = { enable = true },
        },
      },
    },
  },

  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          inlayHints = {
            variableTypes = true,
            functionReturnTypes = true,
          },
        },
      },
    },
  },

  gopls = {
    settings = {
      gopls = {
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
  },

  jsonls = {
    settings = {
      json = {
        -- schemas from schemastore.nvim (if installed)
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    settings = {
      yaml = {
        schemaStore = { enable = true, url = "" },
      },
    },
  },

  sqls = {
    cmd = {
      "sqls",
      "--config",
      vim.fn.expand("~/.config/sqls/sqls.yml"),
    },
  }
}

-- ============================================
-- DIAGNOSTICS CONFIGURATION
-- ============================================
local function setup_diagnostics()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "if_many",
      header = "",
      prefix = "",
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      },
    },
  })
end

-- ============================================
-- KEYMAPS (buffer-local, set on attach)
-- Added here: K, <C-k>, <leader>la, <leader>lr, <leader>lf, [d, ]d, <leader>ld, <leader>lD, <leader>ls, <leader>lS, gt
-- ============================================
local function setup_keymaps(bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
  end

  -- Info
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "<leader>lh", vim.lsp.buf.signature_help, "Signature help")

  -- Actions
  map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

  -- Diagnostics navigation
  map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
  map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
  map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostic")
  map("n", "<leader>lD", function() vim.diagnostic.setloclist() end, "Diagnostics to loclist")

  -- Symbols
  map("n", "<leader>ls", vim.lsp.buf.document_symbol, "Document symbols (native)")
  map("n", "<leader>lS", vim.lsp.buf.workspace_symbol, "Workspace symbols (native)")

  -- Type definition
  map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")
end

-- ============================================
-- ON_ATTACH (enhanced with navic + keymaps + highlights)
-- ============================================
local function enhanced_on_attach(client, bufnr)
  local navic_ok, navic = pcall(require, "nvim-navic")
  -- Navic attachment
  if navic_ok and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- Keymaps (only non-conflicting ones)
  setup_keymaps(bufnr)

  -- Inlay hints (neovim 0.10+)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    -- Force refresh after short delay (lua_ls needs time to respond)
    vim.defer_fn(function()
      if vim.api.nvim_buf_is_valid(bufnr) then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end, 200)
  end

  -- Document highlight
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- ============================================
-- CONFIGURE SERVER (module-level for mason-lspconfig handlers)
-- Defined here so it's available immediately at require time,
-- BEFORE lspconfig.lua calls setup().
-- This avoids a race where mason-lspconfig fires handlers
-- before lsp_setup.setup() can define _configure_server.
-- ============================================
local function configure_server(server_name)
  if configured[server_name] then
    return
  end
  configured[server_name] = true

  local opts = {
    capabilities = capabilities(),
    on_attach = enhanced_on_attach,
  }

  if server_settings[server_name] then
    opts = vim.tbl_deep_extend("force", opts, server_settings[server_name])
  end

  vim.lsp.config(server_name, opts)
  vim.lsp.enable(server_name)
end

M._configure_server = configure_server

-- ============================================
-- MAIN SETUP
-- ============================================
function M.setup()
  setup_diagnostics()

  -- Configure all known servers immediately (handlers are a fallback)
  for server_name, _ in pairs(server_settings) do
    configure_server(server_name)
  end

  -- Extra servers without custom settings
  local extra_servers = { "html", "cssls", "bashls", "dockerls", "marksman" }
  for _, server_name in ipairs(extra_servers) do
    if not server_settings[server_name] then
      configure_server(server_name)
    end
  end
end

-- For mason-lspconfig handlers
function M.get_handlers()
  return {
    function(server_name)
      M._configure_server(server_name)
    end,
    ["rust_analyzer"] = function()
      M._configure_server("rust_analyzer")
    end,
  }
end

return M
