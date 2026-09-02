local theme = require("config.themes")
local highlights = require("config.highlights")

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  enabled = theme.colorscheme == "tokyonight",

  config = function()
    require("tokyonight").setup({
      style = "moon",
      transparent = theme.transparent,

      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = false },
        variables = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },

      on_highlights = function(hl)
        highlights.on_highlights(hl, theme)
      end,
    })
  end,
}
