-- return {
--   "j-hui/fidget.nvim",
--   event = "VeryLazy",
--
--   opts = {
--     progress = {
--       lsp = {
--         log_handler = false,
--       },
--
--       display = {
--         done_ttl = 2,
--       },
--     },
--
--     notification = {
--       override_vim_notify = true,
--       window = {
--         border = "rounded",
--       },
--     },
--   },
-- }

return {
  "j-hui/fidget.nvim",
  -- event = "VeryLazy",
  event = "LspAttach",

  opts = {
    progress = {
      display = {
        done_ttl = 2,
      },
    },

    notification = {
      override_vim_notify = false,
      window = {
        border = "rounded",
      },
    },
  },
}
