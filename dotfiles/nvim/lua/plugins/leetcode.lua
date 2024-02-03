return {
  "ianding1/leetcode.vim",
  vim.cmd([[
  nnoremap <leader>ll :LeetCodeList<cr>
  nnoremap <leader>lt :LeetCodeTest<cr>
  nnoremap <leader>ls :LeetCodeSubmit<cr>
  nnoremap <leader>li :LeetCodeSignIn<cr>
  let g:leetcode_browser = 'firefox'
]]),
}
