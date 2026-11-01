return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

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
        "sql"
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = false,
      },
    })
  end,
}
