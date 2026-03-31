local border_color = "#bd93f9"

-- Base UI
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1f1f1f" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#555555", bg = "none" })

-- CMP
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpBorder", { fg = border_color, bg = "none" })

-- Limpiar fondos
vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpItemKind", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "none" })

-- Coincidencias
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7aa2f7", bold = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpItemAbbrMatch" })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = border_color, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = border_color, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = border_color, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = border_color, bg = "none" })

-- Hover Shift + k
vim.keymap.set("n", "K", function()
  local params = vim.lsp.util.make_position_params(nil, "utf-16")
  vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result, ctx, _)
    if err or not (result and result.contents) then return end

    local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

    lines = vim.tbl_filter(function(line)
      return line ~= ""
    end, lines)

    if vim.tbl_isempty(lines) then return end

    vim.lsp.util.open_floating_preview(lines, "markdown", {
      border = "single",
      max_width = 80,
      max_height = 30,
      focusable = true,
      winblend = 0,
      winhl = "Normal:NormalFloat,FloatBorder:FloatBorder",
    })
  end)
end, { noremap = true, silent = true })

vim.lsp.handlers["textDocument/signatureHelp"] = function() end
