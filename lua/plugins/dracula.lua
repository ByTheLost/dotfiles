local theme = require("config.themes")
local highlights = require("config.highlights")

return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  enabled = theme.colorscheme == "dracula",

  config = function()
    require("dracula").setup({
      transparent_bg = theme.transparent,

      italic_comment = true,
      italic_keyword = true,

      overrides = function()
        if not theme.transparent then
          return {
            CursorLineNr = { fg = "#FFD700", bold = true },

            Pmenu = { bg = "#282a36" },
            PmenuSel = { bg = "#44475a" },

            BlinkCmpLabel = { bg = "#282a36" },
            BlinkCmpKind = { bg = "#282a36" },
          }
        end

        return theme.transparent and highlights.transparent_overrides() or {}
      end,
    })
  end,
}
