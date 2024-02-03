return {
  "axkirillov/hbac.nvim",
  -- Heuristic buffer autocloser
  config = function()
    require("hbac").setup({
      autoclose = true,
      threshold = 60,
    })
  end,
}
