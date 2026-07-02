local theme = require("config.themes")

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
        if not theme.transparent then
          -- Cursor
          hl.CursorLineNr = { fg = "#FFD700", bold = true }

          hl.Pmenu = { bg = "#222436" }
          hl.PmenuSel = { bg = "#44475a" }

          hl.BlinkCmpMenu = { bg = "#222436" }
          hl.BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" }

          hl.BlinkCmpDoc = { bg = "NONE" }
          hl.BlinkCmpDocBorder = { fg = "#bd93f9", bg = "NONE" }

          hl.BlinkCmpLabel = { bg = "#222436" }
          hl.BlinkCmpKind = { bg = "#222436" }

          hl.NormalFloat = { bg = "NONE" }
          hl.FloatBorder = { fg = "#bd93f9", bg = "#222436" }
          hl.Title = { bg = "#222436", fg = "#FFD700", bold = true }
          hl.FloatTitle = { bg = "#222436", fg = "#FFD700", bold = true }
          return
        end

        -- Base
        hl.Normal = { bg = "NONE" }
        hl.NormalNC = { bg = "NONE" }
        hl.NormalFloat = { bg = "NONE" }
        hl.Title = { bg = "NONE", fg = "#FFD700", bold = true }
        hl.FloatTitle = { bg = "NONE", fg = "#FFD700", bold = true }

        -- Border
        hl.FloatBorder = { fg = "#bd93f9", bg = "NONE" }

        -- Cursor
        hl.CursorLineNr = { fg = "#FFD700", bold = true }

        -- Pmenu
        hl.Pmenu = { bg = "NONE" }
        hl.PmenuSel = { bg = "#44475a" }

        -- Blink
        hl.BlinkCmpMenu = { bg = "NONE" }
        hl.BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" }

        hl.BlinkCmpDoc = { bg = "NONE" }
        hl.BlinkCmpDocBorder = { fg = "#bd93f9", bg = "NONE" }

        hl.BlinkCmpLabel = { bg = "NONE" }
        hl.BlinkCmpKind = { bg = "NONE" }

        -- Neo-Tree
        hl.NeoTreeNormal = { bg = "NONE" }
        hl.NeoTreeNormalNC = { bg = "NONE" }
      end,
    })
  end,
}
