return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    require("which-key").setup({
      preset = "modern",
      delay = 300,
    })

    wk.add({
      -- Snacks Picker
      { "<leader>fg", desc = "Live Grep", icon = "" },
      { "<leader>fh", desc = "Help Tags", icon = "󰋖" },
      { "<leader>fs", desc = "Document Symbols", icon = "" },
      { "<leader>fw", desc = "Grep Word Under Cursor", icon = "" },

      -- Harpoon
      { "<leader>h", desc = "Menu Harpoon", icon = "󰍜" },

      -- Harpoon numbers
      { "<leader>1", desc = "Harpoon 1", icon = "󰛢" },
      { "<leader>2", desc = "Harpoon 2", icon = "󰛢" },
      { "<leader>3", desc = "Harpoon 3", icon = "󰛢" },
      { "<leader>4", desc = "Harpoon 4", icon = "󰛢" },
      { "<leader>5", desc = "Harpoon 5", icon = "󰛢" },
      { "<leader>6", desc = "Harpoon 6", icon = "󰛢" },
      { "<leader>7", desc = "Harpoon 7", icon = "󰛢" },
      { "<leader>8", desc = "Harpoon 8", icon = "󰛢" },
      { "<leader>9", desc = "Harpoon 9", icon = "󰛢" },

      -- Atone
      { "<leader>u", desc = "Undo Tree", icon = "" },
    })
  end,
}
