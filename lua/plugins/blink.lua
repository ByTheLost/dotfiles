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
          treesitter = { "lsp" },
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

    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#bd93f9" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#bd93f9" })
    vim.api.nvim_set_hl(0, "BlinkCmpLabel", { bg = "none" })
    vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { bg = "none" })

    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {
      bg = "none",
      fg = "#8be9fd",
    })

    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
      bg = "#44475a",
    })
  end,
}
