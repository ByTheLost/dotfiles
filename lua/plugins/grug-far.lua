return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("grug-far").setup({})
  end,
}
