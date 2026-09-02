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
              Snacks.picker.files()
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
              Snacks.picker.grep()
            end,
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = function()
              Snacks.picker.recent()
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

    explorer = {
      layout = {
        preset = "sidebar",
      },
    },

    notifier = {
      enabled = true,
      notify = true,

      timeout = 3000,
      style = "compact",

      top_down = true,
    },

    picker = {
      prompt = " ",
      win = {
        input = {
          border = "rounded",
          keys = {
            ["<a-s>"] = { "flash", mode = { "n", "i" } },
            ["s"] = { "flash" },
          },
        },
      },
      actions = {
        flash = function(picker)
          require("flash").jump({
            pattern = "^",
            label = { after = { 0, 0 } },
            search = {
              mode = "search",
              exclude = {
                function(win)
                  return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                end,
              },
            },
            action = function(match)
              local idx = picker.list:row2idx(match.pos[1])
              picker.list:_move(idx, true, true)
            end,
          })
        end,
      },
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

    comment = { enabled = false },
  },
}
