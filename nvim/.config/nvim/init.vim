" ==================== 
" Author: fagci
" ====================

" Vim-Plug paths
let s:plug_autoload_path = "~/.config/nvim/autoload/plug.vim"
let s:plug_download_url  = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

" If Plug isn't installed, install it
if !filereadable(expand(s:plug_autoload_path))
    silent exec "!curl -fLo " . fnameescape(s:plug_autoload_path) . " --create-dirs " . s:plug_download_url
    silent exec "so " . fnameescape(s:plug_autoload_path)
endif

call plug#begin("~/.config/nvim/plugged")

" Project navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-fugitive'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'markonm/traces.vim' " range, pattern, substitute preview
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

" Language-specific
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-dadbod'
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}

" LSP, completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Utils
Plug 'vimwiki/vimwiki'
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
" Plug 'airblade/vim-gitgutter'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

filetype plugin indent on
syntax on

" Base
let loaded_matchit=1
let mapleader=','
let maplocalleader=','
set encoding=utf-8
set langmenu=en_US.utf-8
language message en_US.UTF-8
set noswapfile nobackup nowritebackup
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" UI
set number
set signcolumn=yes
set scrolloff=5
set noerrorbells visualbell t_vb=
set shortmess+=c
set splitbelow splitright
set termguicolors
set listchars=tab:▸\ ,space:.,trail:•

" Editing
set nowrap
set clipboard+=unnamedplus
set backspace=start,eol,indent
set smartindent
set expandtab smarttab
set formatoptions=tcqrn1
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" Search
set ignorecase incsearch hlsearch smartcase

" statusline
set stl=[%n]%{&paste?'\ PASTE':''}\  
set stl+=%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%)
set stl+=%(\ \|\ %{FugitiveHead()}%)
set stl+=%(\ \|\ %{coc#status()}%)
set stl+=%=%{&fenc}\ %l:%c/%L\ %y

" speedup
set nocursorline nocursorcolumn norelativenumber
set ttyfast
set lazyredraw
set updatetime=150
set regexpengine=1
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen
set timeoutlen=1000 ttimeoutlen=0  " remove delay on mode change

" Functions

command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Mappings

nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>, :noh<CR>

map <leader>l :set list!<CR>

nnoremap <Leader>s :set spell!<cr>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>

" Navigate windows
nnoremap <C-LEFT> <C-w>h
nnoremap <C-DOWN> <C-w>j
nnoremap <C-UP> <C-w>k
nnoremap <C-RIGHT> <C-w>l

" Move lines
nnoremap <A-DOWN> :m .+1<CR>==
nnoremap <A-UP> :m .-2<CR>==
inoremap <A-DOWN> <Esc>:m .+1<CR>==gi
inoremap <A-UP> <Esc>:m .-2<CR>==gi
vnoremap <A-DOWN> :m '>+1<CR>gv=gv
vnoremap <A-UP> :m '<-2<CR>gv=gv

" Resize windows
noremap <silent> <C-S-Left> :vertical resize -1<CR>
noremap <silent> <C-S-Right> :vertical resize +1<CR>
noremap <silent> <C-S-Up> :resize +1<CR>
noremap <silent> <C-S-Down> :resize -1<CR>

nnoremap <leader>q :bp<bar>bd#<cr>
nnoremap <leader>Q :bp!<bar>bd!#<cr>

" toggle colorcolumn with ,|
nnoremap <silent> <leader><bar> :execute "set colorcolumn="
                  \ . (&colorcolumn == "" ? "80" : "")<CR>

map <tab> :NERDTreeToggle<CR>
noremap <Leader>/ :Commentary<CR>

" Vim-plug

nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pr :PlugClean<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>
nnoremap <silent> <leader>ps :PlugStatus<CR>
nnoremap <silent> <leader>pd :PlugDiff<CR>
nnoremap <silent> <leader>ph :PlugSnapshot

nnoremap <leader><tab> :GFiles --cached --others --exclude-standard<cr>
nnoremap <Leader>F :RG<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>H :History<CR>
nnoremap <Leader>b :Buffers<CR>

" Autocommands

silent !stty -ixon

augroup Ixon
    autocmd! VimLeave * silent !stty ixon
augroup END

augroup ScrollToLastSeenLocationOnFileOpen
    autocmd! BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END

function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl 
    endif
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END


if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif





" COC

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')


let php_html_in_heredoc=0
let php_html_in_nowdoc=0
let php_sql_heredoc=0
let php_sql_nowdoc=0
let php_htmlInStrings=1
let php_sql_query=1

" Used on most machines
let g:coc_global_extensions = ['coc-pairs', 'coc-sh', 'coc-snippets', 'coc-vimlsp', 'coc-diagnostic']

" Also using
"   coc-css coc-emmet coc-eslint coc-html coc-json coc-pairs coc-phpls coc-prettier coc-sh 
"   coc-snippets coc-sql coc-tslint-plugin coc-tsserver coc-vetur coc-vimlsp coc-yaml coc-diagnostic 

let g:rg_derive_root = 1

let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeIgnore=['.vscode', '.idea', '\~$', '^\.git$']

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'fzf']

let gruvbox_transp_bg=v:true
color gruvbox8_hard
hi   StatusLine         gui=NONE      guifg=#ffffff guibg=NONE
hi   SpecialKey         ctermfg=239   guifg=#666666
hi   LineNr             ctermfg=239   guifg=#666666
hi   IndentGuidesOdd    ctermbg=236   guibg=#282828
hi   IndentGuidesEven   ctermbg=235   guibg=#323232

hi! DiffAdd ctermbg=none ctermfg=green gui=none guibg=none guifg=green
hi! DiffDelete ctermbg=none ctermfg=red gui=none guibg=none guifg=darkred
hi! DiffChangeDelete ctermbg=none ctermfg=grey gui=none guibg=none guifg=grey
hi! DiffChange ctermbg=none ctermfg=grey gui=none guibg=none guifg=grey
hi! CocWarningSign guifg=#ffff00

