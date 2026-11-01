-- blink.cmp: Fast and lightweight completion engine for Neovim with LSP, snippets, buffer, path, and AI suggestions
-- URL: https://github.com/saghen/blink.cmp

return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",

  dependencies = {
    "L3MON4D3/LuaSnip",
  },

  opts = {
    snippets = {
      preset = "luasnip",
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    keymap = {
      preset = 'super-tab',
    },

    completion = {
      menu = {
        border = "rounded",
        draw = {
          gap = 1,
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", "label", gap = 2 },
            { "kind", "label_description", gap = 1 },
          },
        },
      },

      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },

      accept = {
        auto_brackets = {
          enabled = true,
        },
      },

      ghost_text = {
        enabled = true,
      },
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },

    fuzzy = {
      implementation = "rust",
    },
  },

  config = function(_, opts)
    require("blink.cmp").setup(opts)
  end,
}
