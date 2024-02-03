return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil" },
    { "<leader>oc", "<cmd>OilClose<cr>", desc = "Close Oil" },
    { "<leader>ot", "<cmd>OilToggle<cr>", desc = "Toggle Oil" },
  },
}
