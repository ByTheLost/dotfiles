-- lua/config/highlights.lua
-- Único punto de verdad para overrides de highlights en todos los temas.
-- Ver diseño en `init.lua` para orden de carga.

local M = {}

-- ============================================
-- ALWAYS: se aplican con cualquier tema y modo
-- ============================================
local ALWAYS = {
  LspInlayHint = { fg = "#636da6", bg = "NONE", italic = true },
  ["@markup.strong"] = { bold = true, fg = "#FFD700" },
}

-- ============================================
-- TRANSPARENT: solo cuando transparent = true
-- ============================================
local TRANSPARENT = {
  Normal = { bg = "NONE" },
  NormalNC = { bg = "NONE" },
  NormalFloat = { bg = "NONE" },
  Title = { bg = "NONE", fg = "#FFD700", bold = true },
  FloatTitle = { bg = "NONE", fg = "#FFD700", bold = true },
  FloatBorder = { fg = "#bd93f9", bg = "NONE" },
  SnacksPickerBorder = { fg = "#bd93f9", bg = "NONE" },
  CursorLineNr = { fg = "#FFD700", bold = true },

  -- Pmenu
  Pmenu = { bg = "NONE" },
  PmenuSel = { bg = "#44475a" },

  -- Blink
  BlinkCmpMenu = { bg = "NONE" },
  BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" },
  BlinkCmpMenuSelection = { bg = "#44475a" },
  BlinkCmpDoc = { bg = "NONE" },
  BlinkCmpDocBorder = { fg = "#bd93f9" },
  BlinkCmpLabel = { bg = "NONE" },
  BlinkCmpLabelMatch = { bg = "NONE" },
  BlinkCmpKind = { bg = "NONE" },

  -- Neo-tree
  NeoTreeNormal = { bg = "NONE" },
  NeoTreeNormalNC = { bg = "NONE" },

  -- Barbecue
  WinBar = { bg = "NONE" },
  WinBarNC = { bg = "NONE" },

  -- StatusLine (gray line fix for transparent themes)
  StatusLine = { fg = "NONE", bg = "NONE" },
  StatusLineNC = { fg = "NONE", bg = "NONE" },
}

-- ============================================
-- NON_TRANSPARENT: por tema, cuando transparent=false
-- ============================================
local NON_TRANSPARENT = {
  tokyonight = {
    CursorLineNr = { fg = "#FFD700", bold = true },
    Pmenu = { bg = "#222436" },
    PmenuSel = { bg = "#44475a" },
    BlinkCmpMenu = { bg = "#222436" },
    BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" },
    BlinkCmpDoc = { bg = "NONE" },
    BlinkCmpDocBorder = { fg = "#bd93f9", bg = "NONE" },
    BlinkCmpLabel = { bg = "#222436" },
    BlinkCmpKind = { bg = "#222436" },
    NormalFloat = { bg = "NONE" },
    SnacksPickerBorder = { fg = "#bd93f9", bg = "#222436" },
    FloatBorder = { fg = "#bd93f9", bg = "#222436" },
    Title = { bg = "#222436", fg = "#FFD700", bold = true },
    FloatTitle = { bg = "#222436", fg = "#FFD700", bold = true },
    WinBar = { bg = "#222436" },
    WinBarNC = { bg = "#222436" },
  },
  dracula = {
    CursorLineNr = { fg = "#FFD700", bold = true },
    Pmenu = { bg = "#282a36" },
    PmenuSel = { bg = "#44475a" },
    BlinkCmpMenu = { bg = "#282a36" },
    BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" },
    BlinkCmpDoc = { bg = "NONE" },
    BlinkCmpDocBorder = { fg = "#bd93f9", bg = "NONE" },
    BlinkCmpLabel = { bg = "#282a36" },
    BlinkCmpKind = { bg = "#282a36" },
    NormalFloat = { bg = "NONE" },
    SnacksPickerBorder = { fg = "#bd93f9", bg = "#282a36" },
    FloatBorder = { fg = "#bd93f9", bg = "#282a36" },
    Title = { bg = "#282a36", fg = "#FFD700", bold = true },
    FloatTitle = { bg = "#282a36", fg = "#FFD700", bold = true },
    WinBar = { bg = "#282a36" },
    WinBarNC = { bg = "#282a36" },
  },
  catppuccin = {
    CursorLineNr = { fg = "#FFD700", bold = true },
    Pmenu = { bg = "#1E1E2E" },
    PmenuSel = { bg = "#44475a" },
    BlinkCmpMenu = { bg = "#1E1E2E" },
    BlinkCmpMenuBorder = { fg = "#bd93f9", bg = "NONE" },
    BlinkCmpDoc = { bg = "NONE" },
    BlinkCmpDocBorder = { fg = "#bd93f9", bg = "NONE" },
    BlinkCmpLabel = { bg = "#1E1E2E" },
    BlinkCmpKind = { bg = "#1E1E2E" },
    NormalFloat = { bg = "NONE" },
    SnacksPickerBorder = { fg = "#bd93f9", bg = "#1E1E2E" },
    FloatBorder = { fg = "#bd93f9", bg = "#1E1E2E" },
    Title = { bg = "#1E1E2E", fg = "#FFD700", bold = true },
    FloatTitle = { bg = "#1E1E2E", fg = "#FFD700", bold = true },
    WinBar = { bg = "#1E1E2E" },
    WinBarNC = { bg = "#1E1E2E" },
  },
}

-- ============================================
-- Helpers
-- ============================================

local function merge(t, src)
  for k, v in pairs(src) do
    t[k] = v
  end
  return t
end

-- ============================================
-- API pública
-- ============================================

--- Devuelve tabla de overrides para catppuccin / dracula.
--- @param theme table: de config.themes
--- @param cs_name string: "tokyonight" | "catppuccin" | "dracula"
function M.overrides(theme, cs_name)
  local o = {}
  merge(o, ALWAYS)
  if theme.transparent then
    merge(o, TRANSPARENT)
  else
    local specific = NON_TRANSPARENT[cs_name]
    if specific then
      merge(o, specific)
    end
  end
  return o
end

--- Modifica hl in-place para tokyonight (callback on_highlights).
--- @param hl table: el hl que recibe on_highlights
--- @param theme table: de config.themes
function M.on_highlights(hl, theme)
  merge(hl, ALWAYS)
  if theme.transparent then
    merge(hl, TRANSPARENT)
  else
    local specific = NON_TRANSPARENT.tokyonight
    if specific then
      merge(hl, specific)
    end
  end
end

return M
