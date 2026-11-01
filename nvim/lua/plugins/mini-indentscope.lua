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
        "neo-tree",
        "oil_preview",
        "help",
        "lazy",
        "mason",
      },

      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
