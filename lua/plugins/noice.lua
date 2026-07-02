-- Notify
-- return {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--
--   opts = {
--     presets = {
--       command_palette = true,
--       lsp_doc_border = true,
--     },
--
--     notify = {
--       enabled = true,
--       view = "notify",
--     },
--
--     messages = {
--       enabled = true,
--       view = "notify",
--     },
--
--     routes = {
--       {
--         filter = {
--           event = "lsp",
--           kind = "progress",
--         },
--
--         opts = {
--           skip = true,
--         },
--       },
--     },
--   },
--
--   dependencies = {
--     "rcarriga/nvim-notify",
--   },
-- }

-- Snacks Notify
return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = {
    presets = {
      command_palette = true,
      lsp_doc_border = true,
    },

    notify = {
      enabled = false,
    },

    messages = {
      enabled = true,
    },

    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
        },

        opts = {
          skip = true,
        },
      },
    },
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
