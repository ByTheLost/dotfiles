return {
  "folke/snacks.nvim",

  priority = 1000,
  lazy = false,

  opts = {
    dashboard = {
      enabled = true,

      preset = {
        header = string.rep("\n", 2) .. [[
 ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗██╗   ██╗██╗███╗   ███╗
██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║
██║  ███╗███████║██║   ██║███████╗   ██║   ██║   ██║██║██╔████╔██║
██║   ██║██╔══██║██║   ██║╚════██║   ██║   ██║   ██║██║██║╚██╔╝██║
╚██████╔╝██║  ██║╚██████╔╝███████║   ██║   ╚██████╔╝██║██║ ╚═╝ ██║
 ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝╚═╝     ╚═╝
]],

        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = function()
              require("fzf-lua").files()
            end,
          },
          {
            icon = " ",
            key = "n",
            desc = "New File",
            action = ":ene | startinsert",
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = function()
              require("fzf-lua").live_grep()
            end,
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = function()
              require("fzf-lua").oldfiles()
            end,
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":edit $MYVIMRC",
          },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            action = function()
              require("persistence").load()
            end,
          },
          {
            icon = "󰒲 ",
            key = "l",
            desc = "Lazy",
            action = ":Lazy",
          },
          {
            icon = " ",
            key = "q",
            desc = "Quit",
            action = ":qa",
          },
        },
      },
    },

    notifier = {
      enabled = true,
      notify = true,

      timeout = 3000,
      style = "compact",

      top_down = true,
    },

    quickfile = {
      enabled = true,
    },

    scope = {
      enabled = true,
    },

    statuscolumn = {
      enabled = true,

      left = {
        "mark",
        "sign",
        "fold",
      },

      right = {
        "git",
      },
    },

    styles = {
      lazygit = {
        border = "rounded",
        wo = {
          winhighlight = "FloatBorder:FloatBorder",
        },
      },
    },
  },
}
