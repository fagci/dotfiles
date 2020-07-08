" ===================================================================
"
" File: .vimrc
" Author: fagci
"
" Description:
"   Yet another vimrc file by web developer.
"   Single file because of easy editing. Trying to keep things simple.
"
" ===================================================================

" {{{ Base settings

set nocompatible

syntax on
filetype plugin indent on

let mapleader=','
let maplocalleader=','
set encoding=utf-8
" set modelines=0 " security
set modeline
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
" set copyindent
" set autoindent
" set smartindent
set expandtab smarttab
set formatoptions=tcqrn1
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" UI
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif
set laststatus=2
set foldlevelstart=99
set splitbelow splitright
set noerrorbells visualbell t_vb=
set wildmenu
set guioptions-=e
set showmode
set shortmess=Iatc
" set background=dark 
set listchars=tab:▸\ ,trail:•
if has('termguicolors')
    set termguicolors
endif

" statusline
set stl=[%n]\ 
set stl+=%(%{WebDevIconsGetFileTypeSymbol()}\ %r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%)
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
set regexpengine=1
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen

set fillchars+=vert:│
set diffopt+=foldcolumn:0
set suffixesadd=.ts,.js,.tsx,.jsx,.json   "gf extensions

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

if !isdirectory($HOME.'/.vim/undodir')
    call mkdir($HOME.'/.vim/undodir', 'p', 0700)
endif

" Create spells directory

if !isdirectory($HOME.'/.vim/spell')
    call mkdir($HOME.'/.vim/spell', 'p', 0700)
endif

" Download spell dictionaries

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
Plug 'godlygeek/tabular'

" Search & replace

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'kshenoy/vim-signature'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'lifepillar/vim-gruvbox8'

" Linters, autocompletions

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" Syntax & lang

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-dadbod'
Plug 'stephpy/vim-yaml', { 'for': [ 'yaml' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'tpope/vim-liquid'
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'evidens/vim-twig', { 'for': 'twig' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

Plug 'adoy/vim-php-refactoring-toolbox'

" Utils

Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim' " :GV
Plug 'vimwiki/vimwiki'

Plug 'markonm/traces.vim'

call plug#end()

" }}}

" {{{ Plugin settings

let g:rg_derive_root = 1
let g:fzf_command_prefix = 'Fzf'

let g:coc_git_status = 0

let g:coc_global_extensions = [
            \   'coc-css',
            \   'coc-diagnostic',
            \   'coc-emmet',
            \   'coc-eslint',
            \   'coc-html',
            \   'coc-json',
            \   'coc-pairs',
            \   'coc-phpls',
            \   'coc-prettier',
            \   'coc-sh',
            \   'coc-snippets',
            \   'coc-sql',
            \   'coc-tslint-plugin',
            \   'coc-tsserver',
            \   'coc-vetur',
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
            \   'snippetIndicator': ' ►',
            \   'timeout': 500,
            \   'triggerAfterInsertEnter': v:true,
            \ },
            \ 'diagnostic': {
            \   'errorSign'  : 'X',
            \   'warningSign': '!',
            \   'infoSign'   : 'i',
            \   'hintSign'   : '?'
            \ },
            \ 'diagnostic-languageserver.filetypes': {
            \   'vim': 'vint',
            \   'sh': 'shellcheck',
            \   'php': ['phpstan', 'psalm'],
            \  },
            \ 'coc.preferences.formatOnSaveFiletypes': [
            \   'php',
            \   'css',
            \   'markdown',
            \   'javascript',
            \   'typescript',
            \ ],
            \ 'suggest.floatEnable': v:false,
            \ 'coc.preferences.diagnostic.refreshOnInsertMode': v:true,
            \ }
let php_html_in_heredoc=0
let php_html_in_nowdoc=0
let php_sql_heredoc=0
let php_sql_nowdoc=0
let php_htmlInStrings=1
let php_sql_query=1

let g:vue_pre_processors = []

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'fzf']

let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeIgnore=['.vscode', '.idea', '\~$', '^\.git$']

" colorschemes

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
    autocmd FileType markdown setlocal sw=2 ts=2 
    autocmd FileType html,css,scss,javascript,typescript,json,vue,yaml setlocal ts=2 sw=2 sts=2

    autocmd FileType css setlocal iskeyword+=- " for css3 box-shadow etc
    autocmd FileType scss setlocal iskeyword+=- " for css3 box-shadow etc
augroup END

augroup ScrollToLastSeenLocationOnFileOpen
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END

" }}}

" Custom {{{

if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif

" }}}

colorscheme gruvbox8_hard

hi clear SignColumn

hi   Normal             ctermbg=NONE  guibg=NONE 
hi   SpecialKey         ctermfg=239   guifg=#666666
hi   LineNr             ctermfg=239   guifg=#666666
hi   IndentGuidesOdd    ctermbg=236   guibg=#282828
hi   IndentGuidesEven   ctermbg=235   guibg=#323232

