" ===================================================================
"
" File: .vimrc
" Author: fagci
"
" Description:
"   Yet another vimrc file by web developer.
"   Single file because of easy editing. Trying to keep things simple.
"
" for spell checking the following command:
" > for x in en.utf-8.spl en.utf-8.sug ru.utf-8.spl ru.utf-8.sug ; do wget http://ftp.vim.org/vim/runtime/spell/$x; done
" should be executed in ~/.vim/spell
" TODO: adopt for autoinstall
" ===================================================================

" {{{ Base settings

set nocompatible

syntax on
filetype plugin indent on

let mapleader=","
let maplocalleader=","
set encoding=utf-8
set modelines=0 " security
set spelllang=ru,en

" Editing
set backspace=indent,eol,start
set colorcolumn=80
set number
set nowrap
set showmatch
set scrolloff=5
set clipboard+=unnamedplus
set pastetoggle=<F2>
set conceallevel=0

" Indentation
set copyindent
set smartindent smarttab expandtab
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" UI
set signcolumn=yes
set laststatus=2
set foldlevelstart=99
set splitbelow splitright
set noerrorbells visualbell t_vb=
set wildmenu
set guioptions-=e
set showmode
set shortmess=Iatc
set background=dark
set list listchars=tab:⎸\ ,trail:·
"set t_ut= " fixes weird bg over line

" statusline
set stl=[%n]\ 
set stl+=%(%{WebDevIconsGetFileTypeSymbol()}\ %r%t%{(&mod?'*':'')}%)
set stl+=%(\ \|\ %{FugitiveHead()}%)
set stl+=%(\ \|\ %{coc#status()}%)
set stl+=%=%{&fenc}\ %l/%L\ %y

" History
set noswapfile nobackup nowritebackup
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Search
set ignorecase incsearch hlsearch smartcase

" Speedup
set nocursorline nocursorcolumn norelativenumber
set ttyfast
set lazyredraw
set updatetime=300
" set synmaxcol=256 " UTF = x2
syntax sync minlines=256
set regexpengine=1
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1


set fillchars+=vert:│
set diffopt+=foldcolumn:0

" Cursor shape

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\" " normal
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\" " insert
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[3 q\<Esc>\\" " replace
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
    let &t_SR = "\e[3 q"
endif


" }}}

" {{{ Prepare workspace

" Create undodir if not exists

if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p", 0700)
endif

if !isdirectory($HOME."/.vim/spell")
    call mkdir($HOME."/.vim/spell", "p", 0700)
endif

if empty(glob("~/.vim/spell/ru.utf-8.spl"))
    echomsg 'Installing spell dictionaries...'
    !cd "${HOME}/.vim/spell" 
                \ && for x in en.utf-8.spl en.utf-8.sug ru.utf-8.spl ru.utf-8.sug ; do
                \ echo "$x" ;
                \ wget -qO "${HOME}/.vim/spell/$x" http://ftp.vim.org/vim/runtime/spell/$x ;
                \ done
endif

" Install plugin manager

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" }}}

" Plugins {{{

call plug#begin('~/.vim/plugged')

Plug 'tweekmonster/startuptime.vim'

" Editing

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'

" Search & replace

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI

Plug 'mbbill/undotree'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'kshenoy/vim-signature'

Plug 'Yggdroot/indentLine'

Plug 'lifepillar/vim-gruvbox8'

" Linters, autocompletions

Plug 'neoclide/coc.nvim', {'branch': 'master'}
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" Syntax & lang

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-dadbod'
Plug 'stephpy/vim-yaml', { 'for': [ 'yaml' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'tpope/vim-liquid'

Plug 'adoy/vim-php-refactoring-toolbox'

" Utils

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim' " :GV
Plug 'xolox/vim-misc'
Plug 'jceb/vim-orgmode'

call plug#end()

" }}}

" {{{ Plugin settings

let g:rg_derive_root = 1
let g:fzf_command_prefix = 'Fzf'

let g:coc_git_status = 0

let g:coc_global_extensions = [
            \   'coc-calc',
            \   'coc-css',
            \   'coc-diagnostic',
            \   'coc-emmet',
            \   'coc-eslint',
            \   'coc-html',
            \   'coc-json',
            \   'coc-pairs',
            \   'coc-phpls',
            \   'coc-sh',
            \   'coc-snippets',
            \   'coc-sql',
            \   'coc-tslint-plugin',
            \   'coc-tsserver',
            \   'coc-vetur',
            \   'coc-vimlsp',
            \   'coc-yaml',
            \ ]

let g:coc_user_config = {
            \ 'coc.preferences.jumpCommand': 'split',
            \ 'suggest': {
            \   'enablePreview': v:false,
            \   'maxCompleteItemCount': 48,
            \   'minTriggerInputLength': 2,
            \   'noselect': v:false,
            \   'preferCompleteThanJumpPlaceholder': v:true,
            \   "snippetIndicator": " ►",
            \   'timeout': 500,
            \   "triggerAfterInsertEnter": v:true,
            \ },
            \ 'diagnostic': {
            \ 'displayByAle': v:false,
            \   'errorSign'  : 'X',
            \   'warningSign': '!',
            \   'infoSign'   : 'i',
            \   'hintSign'   : '?'
            \ },
            \ "diagnostic-languageserver.filetypes": {
            \    "vim": "vint",
            \    "sh": "shellcheck",
            \    "php": ["phpstan", "psalm"],
            \  },
            \ "coc.preferences.formatOnSaveFiletypes": [
            \ "php",
            \ "css",
            \ "markdown",
            \ "javascript",
            \ "typescript",
            \ ],
            \ "suggest.floatEnable": v:false
            \ }

let php_html_in_heredoc=0
let php_html_in_nowdoc=0
let php_sql_heredoc=0
let php_sql_nowdoc=0

let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 25
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore=['.vscode', '.idea', '\~$', '^\.git$']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:DevIconsEnableFoldersOpenClose = 1

let g:indentLine_char = '⎸'

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold=1
let g:gruvbox_italic=1

" }}}

" Functions {{{

" coc
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! <SID>BufMakeScratch()
    setl buftype=nofile
    setl bufhidden=hide
    setl noswapfile
    setl nobuflisted
endfun

command! -bar BufScratch tabnew|call <SID>BufMakeScratch()
command! -bar BufScratchTab tabnew|call <SID>BufMakeScratch()
command! -bar BufScratchVSplit vnew|call <SID>BufMakeScratch()
command! -bar BufScratchSplit new|call <SID>BufMakeScratch()

command! -bar CBCopy !xclip -f -selection clipboard
command! -bar CBPaste r!xclip -o -selection clipboard

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> <leader>C :call ToggleConcealLevel()<CR>

" }}}

" {{{ Mappings

command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)

nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>
map <tab> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>, :noh<CR>
noremap <Leader>/ :Commentary<CR>
map <leader>l :set list!<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nnoremap <silent> + :exe "resize " . (winheight(0) * 8/7)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 7/8)<CR>
nnoremap <silent> = :exe "vertical resize " . (winwidth(0) * 8/7)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 7/8)<CR>

nnoremap <Leader>s :set spell!<cr>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>

nnoremap <leader>q :bp<bar>bd#<cr>
nnoremap <leader>Q :bp!<bar>bd!#<cr>

nnoremap <leader><tab> :FzfGFiles --cached --others --exclude-standard<cr>
nnoremap <Leader>F :RG<CR>
nnoremap <Leader>f :FzfFiles<CR>
nnoremap <Leader>H :FzfHistory<CR>
nnoremap <Leader>b :FzfBuffers<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Vim-plug

nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pr :PlugClean<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>
nnoremap <silent> <leader>ps :PlugStatus<CR>
nnoremap <silent> <leader>pd :PlugDiff<CR>
nnoremap <silent> <leader>ph :PlugSnapshot


nnoremap <silent> <leader>n :ScratchToggle<cr> " Scratch buffer

nnoremap <leader>sql :BufScratchSplit<bar>set filetype=mysql<cr>
nnoremap <leader>D :%DB<cr>

vnoremap <leader>y :'<,'>!xclip -selection clipboard<cr>

" }}}

" Autocmds {{{

silent !stty -ixon
autocmd VimLeave * silent !stty ixon

autocmd CursorHold * silent call CocActionAsync('highlight')

" Syntax

augroup FileTypes
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal sw=2 ts=2 

    autocmd FileType css setlocal iskeyword+=- " for css3 box-shadow etc
    autocmd FileType scss setlocal iskeyword+=- " for css3 box-shadow etc
augroup END

augroup ScrollToLastSeenLocationOnFileOpen
    autocmd!
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &filetype !~# 'commit' | exe "normal! g`\"" | endif
augroup END

" }}}

" Custom {{{

if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif

" }}}

colorscheme gruvbox8_hard
hi clear SignColumn

hi SpecialKey ctermfg=239

