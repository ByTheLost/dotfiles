return {
  "echasnovski/mini.indentscope",
  version = "*",
  config = function()
    require("mini.indentscope").setup({
      symbol = "│",

      options = {
        try_as_border = false,
      },

      draw = {
        delay = 50,
        animation = function()
          return 20
        end,
      },

      exclude = {
        buftypes = { "nofile", "prompt", "help", "quickfix", "terminal" },
      },
    })
  end
}
