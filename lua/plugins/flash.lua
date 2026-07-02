return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup({
      labels = "asdfjklhgqwertyuiop",
      search = {
        highlight = { backdrop = false, group = "Search" },
      },
    })
  end,
}
