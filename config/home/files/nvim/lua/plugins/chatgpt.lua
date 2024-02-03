-- Lazy
return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup()
  end,
  keys = {
    { "<leader>cc<cr>", "<cmd>ChatGPT<cr>", desc = "deploy ChatGPT" },
    { "<leader>cca", "<cmd>ChatGPTActAs<cr>", desc = "Run ChatGPT as ..." },
    { "<leader>cce", "<cmd>ChatGPTEditWithInstruction<cr>", desc = "run ChatGPT to edit code with instruction" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
