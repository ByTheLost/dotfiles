return {
  "L3MON4D3/LuaSnip",
  -- event = "VeryLazy",
  event = "InsertEnter",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  config = function()
    local ls = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })
  end,
}
