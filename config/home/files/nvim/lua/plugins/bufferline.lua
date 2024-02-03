return {
  "akinsho/bufferline.nvim",
  -- It's a bar that shows your open buffers
  opts = {
    options = {
      offsets = { text_align = "left" },
      separator_style = { "", "" },
      indicator = { style = "none" },
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      always_show_bufferline = true,
    },
  },
}
