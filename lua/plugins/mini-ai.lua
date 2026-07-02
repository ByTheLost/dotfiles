return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",

  opts = function()
    local ai = require("mini.ai")

    return {
      n_lines = 500,

      custom_textobjects = {
        -- Blocks (if/loops/etc con treesitter)
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),

        -- Functions
        f = ai.gen_spec.treesitter({
          a = "@function.outer",
          i = "@function.inner",
        }),

        -- Classes
        c = ai.gen_spec.treesitter({
          a = "@class.outer",
          i = "@class.inner",
        }),

        -- HTML / XML tags
        t = {
          "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
          "^<.->().*()</[^/]->$",
        },

        -- Numbers
        d = { "%f[%d]%d+" },

        -- Words with case handling
        e = {
          {
            "%u[%l%d]+%f[^%l%d]",
            "%f[%S][%l%d]+%f[^%l%d]",
            "%f[%P][%l%d]+%f[^%l%d]",
            "^[%l%d]+%f[^%l%d]",
          },
          "^().*()$",
        },

        -- Function calls
        u = ai.gen_spec.function_call(),
        U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
      },
    }
  end,

  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
