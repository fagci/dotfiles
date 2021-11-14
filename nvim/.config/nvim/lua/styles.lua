vim.o.background = "dark"

local prefix = vim.fn.getenv("PREFIX")

if string.find(tostring(prefix), 'termux') then
    vim.g.gruvbox_italic=0
    vim.g.gruvbox_italicize_comments=0
    vim.g.gruvbox_italicize_strings=0

    vim.g.sonokai_disable_italic_comment=1
    vim.g.sonokai_enable_italic = 0
    vim.g.sonokai_style = 'andromeda'
end

vim.cmd([[
" colorscheme gruvbox
colorscheme sonokai

let &fcs='eob: '

augroup fix_colors
autocmd!
autocmd ColorScheme * hi clear SignColumn LineNr 
autocmd ColorScheme * hi LspDiagnosticsSignError guibg=none guifg=red
autocmd ColorScheme * hi LspDiagnosticsSignWarning guibg=none guifg=yellow
autocmd ColorScheme * hi LspDiagnosticsSignInformation guibg=none guifg=green
autocmd ColorScheme * hi LspDiagnosticsSignHint guibg=none guifg=cyan
autocmd ColorScheme * hi ColorColumn ctermbg=242 guibg=#2e2e2e
autocmd ColorScheme * hi MatchParen guibg=#333333
augroup END
]])

