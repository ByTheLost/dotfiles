local M = {}

function M.get(name)
  if name == "catppuccin" then
    return require("catppuccin.utils.lualine")()
  end
  return name -- tokyonight, dracula funcionan como string
end

return M
