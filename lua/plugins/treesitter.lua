return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- event = { "BufReadPost", "BufNewFile" },

  lazy = false,
  priority = 1000,

  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    configs.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "bash",
        "python",
        "c",
        "cpp",
        "rust",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    })
  end,
}
