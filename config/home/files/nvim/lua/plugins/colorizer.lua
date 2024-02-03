return {
  "NvChad/nvim-colorizer.lua",
  -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
  config = function()
    require("colorizer").setup({
      user_default_options = {
        tailwind = true,
      },
    })
  end,
}
