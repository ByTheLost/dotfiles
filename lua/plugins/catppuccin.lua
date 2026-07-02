local theme = require("config.themes")
local highlights = require("config.highlights")

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  enabled = theme.colorscheme == "catppuccin",

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = theme.transparent,

      float = {
        transparent = theme.transparent,
      },

      integrations = {
        treesitter = true,
        lsp_trouble = true,
        cmp = true,
        gitsigns = true,
        telescope = true,

        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
        },

        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },

      overrides = function()
        if not theme.transparent then
          return {}
        end

        return highlights.transparent_overrides()
      end,
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin",
      callback = function()
        if not theme.transparent then
          return
        end

        local hl = vim.api.nvim_set_hl

        -- Base UI
        hl(0, "Normal", { bg = "NONE" })
        hl(0, "NormalNC", { bg = "NONE" })
        hl(0, "NormalFloat", { bg = "NONE" })
        hl(0, "FloatBorder", { bg = "NONE" })
        hl(0, "FloatTitle", { bg = "NONE" })

        -- Menu / completion
        hl(0, "Pmenu", { bg = "NONE" })
        hl(0, "PmenuSel", { bg = "#44475a" })

        -- Telescope
        hl(0, "TelescopeNormal", { bg = "NONE" })
        hl(0, "TelescopePromptNormal", { bg = "NONE" })
        hl(0, "TelescopeResultsNormal", { bg = "NONE" })
        hl(0, "TelescopePreviewNormal", { bg = "NONE" })

        -- Cursor line (opcional)
        hl(0, "CursorLine", { bg = "NONE" })
      end,
    })
  end,
}
