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
      -- Fzf-lua
      { "<leader>fg", desc = "Live Grep", icon = "" },
      { "<leader>fh", desc = "Help Tags", icon = "󰋖" },
      { "<leader>fs", desc = "Document Symbols", icon = "" },
      { "<leader>fw", desc = "Grep Word Under Cursor", icon = "" },

      -- Harpoon
      { "<leader>h", desc = "Menu Harpoon", icon = "󰍜" },

      -- -- Harpoon numbers
      -- { "<leader>1", desc = "Harpoon 1", icon = "1️⃣" },
      -- { "<leader>2", desc = "Harpoon 2", icon = "2️⃣" },
      -- { "<leader>3", desc = "Harpoon 3", icon = "3️⃣" },
      -- { "<leader>4", desc = "Harpoon 4", icon = "4️⃣" },
      -- { "<leader>5", desc = "Harpoon 5", icon = "5️⃣" },
      -- { "<leader>6", desc = "Harpoon 6", icon = "6️⃣" },
      -- { "<leader>7", desc = "Harpoon 7", icon = "7️⃣" },
      -- { "<leader>8", desc = "Harpoon 8", icon = "8️⃣" },
      -- { "<leader>9", desc = "Harpoon 9", icon = "9️⃣" },

      -- Atone
      { "<leader>u", desc = "Undo Tree", icon = "" },
    })
  end,
}
