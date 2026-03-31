return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        initial_mode = "normal",           -- iniciar en modo normal
        selection_caret = "➤  ",           -- flecha ligera
        entry_prefix = "  ",               -- espacios antes de cada línea
        prompt_prefix = "   ",           -- icono de búsqueda + flecha
        path_display = { "smart" },        -- rutas limpias
        sorting_strategy = "ascending",    -- los resultados van de arriba hacia abajo

        -- Aquí van los mappings correctos
        mappings = {
          n = {
            ["<leader>q"] = require("telescope.actions").close,  -- cerrar en modo normal
          },
          i = {
            ["<leader>q"] = require("telescope.actions").close,  -- cerrar en modo insert
          },
        },
      },
    })

    -- Quitar fondo gris de la selección
    vim.cmd [[
      highlight TelescopeSelection guibg=NONE guifg=#FFD700
      highlight TelescopePromptPrefix guifg=#00FFFF
    ]]
  end,
}
