-- config/autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "typescript",
    "tsx",
    "jsx",
    "lua",
    "python",
    "html",
    "css",
    "json",
    "bash",
  },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Telescope transparente
    local groups = {
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePromptNormal",
      "TelescopeResultsNormal",
      "TelescopePreviewNormal",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    -- tu UI (cmp, floats, etc)
    require("config.ui")
  end,
})
