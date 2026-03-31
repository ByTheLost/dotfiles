return {
  "folke/flash.nvim",
  config = function()
    require("flash").setup({
      labels = "asdfjklhgqwertyuiop",
      search = {
        highlight = { backdrop = false, group = "Search" },
      },
    })
  end,
}
