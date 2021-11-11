vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * hi MatchParen guibg=#333333
augroup END
]])
