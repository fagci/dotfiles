vim.o.background = "dark"

local prefix = vim.fn.getenv("PREFIX")

if prefix and string.find(tostring(prefix), 'termux') then
	vim.g.gruvbox_italic=0
	vim.g.gruvbox_italicize_comments=0
	vim.g.gruvbox_italicize_strings=0
end

vim.cmd([[
colorscheme gruvbox

augroup matchup_matchparen_highlight
autocmd!
autocmd ColorScheme * hi MatchParen guibg=#333333
augroup END
]])
