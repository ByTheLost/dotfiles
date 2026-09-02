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
        trouble = true,
        gitsigns = true,

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
        return highlights.overrides(theme, "catppuccin")
      end,
    })

    -- Safety net: catppuccin re-aplica highlights internamente después de overrides.
    -- Aplica TODOS los overrides via nvim_set_hl directo (más confiable que overrides).
    local function reapply_overrides()
      local o = highlights.overrides(theme, "catppuccin")
      for group, attrs in pairs(o) do
        vim.api.nvim_set_hl(0, group, attrs)
      end
    end

    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        vim.schedule(reapply_overrides)
      end,
    })
  end,
}
