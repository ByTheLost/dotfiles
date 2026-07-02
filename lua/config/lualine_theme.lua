local M = {}

local map = {
  catppuccin = "catppuccin",
  tokyonight = "tokyonight",
  dracula = "dracula",
}

function M.get(name)
  return map[name] or "auto"
end

return M
