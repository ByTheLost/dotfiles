return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-t>]],
      direction = "float",
    })
  end
}
