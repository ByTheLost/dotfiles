-- Fzf-lua: Fast and lightweight fuzzy finder for Neovim
-- URL: https://github.com/ibhagwan/fzf-lua

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    winopts = {
      title = " Fzf ",
      title_pos = "center",

      height = 0.85,
      width = 0.80,

      border = "rounded",

      preview = {
        layout = "vertical",
        vertical = "right:50%",
        border = "rounded",
      },
    },

    fzf_colors = {
      bg = "-1",
      gutter = "-1",
    },

    fzf_opts = {
      ["--layout"] = "reverse",
      ["--info"] = "inline-right",
      ["--pointer"] = "➤",
      ["--marker"] = "✓",
      ["--prompt"] = "  ",
    },

    files = {
      prompt = "Files ❯ ",
    },

    grep = {
      prompt = "Grep ❯ ",
    },

    buffers = {
      prompt = "Buffers ❯ ",
    },

    oldfiles = {
      prompt = "Recent ❯ ",
    },

    git = {
      files = {
        prompt = "Git ❯ ",
      },
    },
  },

  config = function(_, opts)
    require("fzf-lua").setup(opts)

    vim.cmd([[
      highlight FzfLuaBorder guifg=#bd93f9
      highlight FzfLuaTitle guifg=#FFD700
      highlight FzfLuaCursorLine guibg=NONE
      highlight FzfLuaSearch guifg=#00FFFF
    ]])
  end,
}
