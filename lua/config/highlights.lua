local M = {}

function M.transparent_overrides()
  return {
    -- Base
    Normal = { bg = "NONE" },
    NormalNC = { bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    Title = { bg = "NONE", fg = "#FFD700", bold = true },
    FloatTitle = { bg = "NONE", fg = "#FFD700", bold = true },

    -- Border
    FloatBorder = { fg = "#bd93f9", bg = "NONE" },

    -- Cursor
    CursorLineNr = { fg = "#FFD700", bold = true },

    TelescopeNormal = { bg = "NONE" },
    TelescopeBorder = { fg = "#bd93f9", bg = "NONE" },
    TelescopePromptNormal = { bg = "NONE" },
    TelescopeResultsNormal = { bg = "NONE" },
    TelescopePreviewNormal = { bg = "NONE" },

    Pmenu = { bg = "NONE" },
    PmenuSel = { bg = "#44475a" },

    -- CmpItemAbbr = { bg = "NONE" },
    -- CmpItemAbbrDeprecated = { bg = "NONE" },
    -- CmpItemKind = { bg = "NONE" },
    -- CmpItemMenu = { bg = "NONE" },

    -- Blink
    BlinkCmpMenu = { bg = "NONE" },
    BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" },

    BlinkCmpDoc = { bg = "NONE" },
    BlinkCmpDocBorder = { fg = "#bd93f9", bg = "NONE" },

    BlinkCmpLabel = { bg = "NONE" },
    BlinkCmpKind = { bg = "NONE" },
  }
end

return M
