-- Bufferline.nvim: Display and manage buffers in a tab-like interface
-- URL: https://github.com/akinsho/bufferline.nvim

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    vim.cmd [[
      highlight BufferLineBufferSelected guibg=NONE guifg=#FFD700 gui=bold
      highlight BufferLineIndicatorSelected guibg=NONE guifg=#FFD700
    ]]

    -- Mapeos para navegar entre buffers
    local map = vim.keymap.set
    map("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Siguiente buffer" })
    map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Buffer anterior" })
    map("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>", { desc = "Cerrar buffer" })
    map("n", "<leader>bl", "<cmd>BufferLinePick<CR>", { desc = "Ir a buffer" })
    map("n", "<leader>bt", "<cmd>BufferLineTogglePin<CR>", { desc = "Alterna fijación del buffer" })
  end,
}
