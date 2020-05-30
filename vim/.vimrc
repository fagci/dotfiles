" ===========================
" .vimrc
" Author: fagci
"
" ===========================

" {{{ Base settings

set nocompatible

syntax on
filetype plugin indent on

let mapleader=","
set encoding=utf-8

set backspace=indent,eol,start
set colorcolumn=80
set clipboard=unnamed
set foldenable
"set foldmethod=marker
set foldmarker={{{,}}}
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set modelines=0 " security
set noswapfile
set nobackup
set nowritebackup
set nowrap
set number
set scrolloff=4
set showmatch
set smartcase
set smartindent
set smarttab
set signcolumn=yes
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=300
set noerrorbells visualbell t_vb=
set wildmenu

" Speedup
set nocursorline
set nocursorcolumn
set norelativenumber
set ttyfast
set lazyredraw

set autoindent             " Copy indent from previous line.
set expandtab              " Replace tabs with spaces in Insert mode.
set shiftwidth=2           " Spaces for each (auto)indent.
set smarttab               " Insert and delete sw blanks in the front of a line.
set softtabstop=2          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=2              " Spaces that a <Tab> in file counts for.

set splitbelow
set splitright

set fillchars+=vert:│
set diffopt+=foldcolumn:0

" Don't show Vim's welcome message.
set shortmess=I
" Make the save message shorter. Helps avoid the 'Hit ENTER to continue' message.
set shortmess+=at
" Don't show completion messages. coc.nvim recommends this.
set shortmess+=c

set t_Co=256
set bg=dark

set showtabline=2
set noshowmode

let &t_EI.="\e[1 q" "EI = normal mode cursor
let &t_SI.="\e[5 q" "SI = insert mode cursor
let &t_SR.="\e[3 q" "SR = replace mode cursor

silent !stty -ixon
autocmd VimLeave * silent !stty ixon

" }}}

" {{{ Prepare workspace

" Create undodir if not exists

if !isdirectory($HOME."/.vim/undodir")
  call mkdir($HOME."/.vim/undodir", "p", 0700)
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

" Editing

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Search & replace

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'lvht/tagbar-markdown', { 'for': 'markdown' }
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sainnhe/gruvbox-material'
Plug 'Yggdroot/indentLine'

" Linters, autocompletions

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax & lang

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-dadbod'
Plug 'sheerun/vim-polyglot'

Plug 'gko/vim-coloresque', { 'for': ['css','scss'] } " css color
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'phtml', 'xml']}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': ['php']}

call plug#end()

" }}}

color gruvbox-material

" {{{ Plugin settings

let g:rg_derive_root='true'

let g:lightline = {'colorscheme' : 'gruvbox_material'}

let g:lightline = {
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
       \ },
       \ 'colorscheme': 'gruvbox_material',
       \ 'component_function': {
       \   'gitbranch': 'fugitive#head'
       \ },
       \ }
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1

let g:fzf_command_prefix = 'Fzf'

let g:coc_global_extensions = 'coc-json coc-css coc-phpls coc-html coc-yaml coc-emmet coc-sql coc-ultisnips coc-tag coc-git'
let g:coc_user_config = {
      \ 'suggest': {
      \ 'enablePreview': v:true,
      \ 'noselect': v:false,
      \ 'timeout': 500,
      \ 'preferCompleteThanJumpPlaceholder': v:true,
      \ 'minTriggerInputLength': 2,
      \ },
      \ 'diagnostic': {
      \ 'displayByAle': v:false,
      \ 'errorSign': '•',
      \ 'warningSign': '•',
      \ 'infoSign': '•',
      \ 'hintSign': '•',
      \ }
      \ }

let php_html_in_heredoc=0
let php_html_in_nowdoc=0
let php_sql_heredoc=0
let php_sql_nowdoc=0

let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=25
let NERDTreeIgnore=['.vscode', '.idea', '\~$', '^\.git$']

let g:indentLine_char_list = ['⎸']

" Tagbar {{{
let g:tagbar_width = 30
let g:tagbar_silent = 1
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_sort = 0 " Don't sort alphabetically.
let g:tagbar_map_togglefold = '<ENTER>'
" }}}

" }}}

" Functions {{{

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! <SID>BufMakeScratch()
  setl buftype=nofile
  setl bufhidden=hide
  setl noswapfile
  setl nobuflisted
endfun
command! -bar BufScratch tabnew|call <SID>BufMakeScratch()
command! -bar BufScratchTab tabnew|call <SID>BufMakeScratch()
command! -bar BufScratchVSplit vnew|call <SID>BufMakeScratch()
command! -bar BufScratchSplit new|call <SID>BufMakeScratch()


" }}}

" {{{ Mappings

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
map <tab> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>, :noh<CR>
noremap <Leader>/ :Commentary<CR>
map <leader>l :set list!<CR>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>

nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

nnoremap <leader>q :bp<bar>bd#<cr>
nnoremap <leader>Q :bp!<bar>bd!#<cr>

nmap <leader><tab> :FZF<cr>
nnoremap <silent> <Leader>F :RG<CR>
nnoremap <silent> <Leader>f :FzfFiles<CR>
nnoremap <silent> <Leader>H :FzfHistory<CR>
nnoremap <silent> <Leader>b :FzfBuffers<CR>
nnoremap <Leader>s :FzfBLines<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nnoremap <Leader>o :TagbarToggle<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


nnoremap <silent> <leader>n :ScratchToggle<cr> " Scratch buffer

" }}}

" Autocmds {{{

" File type specific indenting
autocmd FileType c,make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType css,markdown,python,php setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType vim setlocal foldmethod=marker

" }}}

" Custom {{{

if executable('rg')
  "set grepprg=rg\ --no-heading\ --vimgrep
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif


nnoremap <leader>sql :BufScratchSplit<bar>set filetype=mysql<cr>

" }}}

