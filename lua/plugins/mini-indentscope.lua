-- return {
--   "echasnovski/mini.indentscope",
--   event = "VeryLazy",
--   version = "*",
--   config = function()
--     require("mini.indentscope").setup({
--       symbol = "▏",
--
--       options = {
--         try_as_border = true,
--       },
--
--       draw = {
--         delay = 50,
--         animation = function()
--           return 20
--         end,
--       },
--
--       exclude = {
--         buftypes = { "nofile", "prompt", "help", "quickfix", "terminal" },
--         filetypes = { "dashboard", "alpha", "starter", "snacks_dashboard" },
--       },
--     })
--   end
-- }

return {
  "echasnovski/mini.indentscope",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local indentscope = require("mini.indentscope")

    indentscope.setup({
      symbol = "▏",

      options = {
        try_as_border = true,
      },

      draw = {
        delay = 50,

        animation = function()
          return 20
        end,
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "dashboard",
        "alpha",
        "starter",
        "snacks_dashboard",
      },

      callback = function()
        vim.b.miniindentscope_disable = true

        vim.schedule(function()
          vim.cmd("IndentScopeDisable")
        end)
      end,
    })
  end,
}
