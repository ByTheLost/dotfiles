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
        return highlights.overrides(theme, "dracula")
      end,
    })
  end,
}

