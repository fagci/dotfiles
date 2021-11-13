vim.o.background = "dark"

if string.find(vim.fn.getenv("PREFIX"), 'termux') then
	vim.cmd([[
	let g:gruvbox_italic=0
	let g:gruvbox_italicize_comments=0
	let g:gruvbox_italicize_strings=0
	]])
end

vim.cmd([[colorscheme gruvbox]])
vim.cmd([[
augroup matchup_matchparen_highlight
autocmd!
autocmd ColorScheme * hi MatchParen guibg=#333333
augroup END
]])
