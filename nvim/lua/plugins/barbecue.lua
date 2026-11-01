return {
  "utilyre/barbecue.nvim",
  event = "LspAttach",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("barbecue").setup({
      show_dirname = false,
      show_basename = true,
      theme = {
        normal                 = { bg = "NONE" },

        context_file           = { fg = "#89B4FA" }, -- Azul pastel
        context_module         = { fg = "#74C7EC" }, -- Zafiro
        context_namespace      = { fg = "#94E2D5" }, -- Turquesa
        context_package        = { fg = "#A6E3A1" }, -- Verde pastel

        context_class          = { fg = "#CBA6F7" }, -- Malva
        context_interface      = { fg = "#B4BEFE" }, -- Lavanda
        context_struct         = { fg = "#F5C2E7" }, -- Rosa pastel
        context_enum           = { fg = "#FAB387" }, -- Durazno
        context_enum_member    = { fg = "#F9E2AF" }, -- Amarillo pastel

        context_method         = { fg = "#89DCEB" }, -- Celeste
        context_function       = { fg = "#89DCEB" }, -- Celeste
        context_constructor    = { fg = "#CBA6F7" }, -- Malva

        context_property       = { fg = "#F5C2E7" }, -- Rosa pastel
        context_field          = { fg = "#F2CDCD" }, -- Flamingo
        context_variable       = { fg = "#CDD6F4" }, -- Texto claro
        context_constant       = { fg = "#FAB387" }, -- Durazno

        context_string         = { fg = "#A6E3A1" }, -- Verde
        context_number         = { fg = "#FAB387" }, -- Durazno
        context_boolean        = { fg = "#F38BA8" }, -- Rojo pastel
        context_null           = { fg = "#6C7086" }, -- Gris

        context_array          = { fg = "#94E2D5" }, -- Turquesa
        context_object         = { fg = "#89B4FA" }, -- Azul
        context_key            = { fg = "#F9E2AF" }, -- Amarillo

        context_event          = { fg = "#F38BA8" }, -- Rojo pastel
        context_operator       = { fg = "#89DCEB" }, -- Celeste
        context_type_parameter = { fg = "#B4BEFE" }, -- Lavanda
      },
    })
  end,
}
