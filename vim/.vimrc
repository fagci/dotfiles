" ===========================
" VIMRC
" ===========================
"
" Author fagci
"
" ===========================

" Base settings

syntax on
filetype plugin indent on

let mapleader=","
set encoding=utf-8

set backspace=2
set colorcolumn=80
set cursorline
set foldignore=
set foldlevelstart=99
set foldmethod=indent
set foldnestmax=10
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
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
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=300
set visualbell
set wildmenu

set autoindent             " Copy indent from previous line.
set expandtab              " Replace tabs with spaces in Insert mode.
set shiftwidth=2           " Spaces for each (auto)indent.
set smarttab               " Insert and delete sw blanks in the front of a line.
set softtabstop=2          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=2              " Spaces that a <Tab> in file counts for.

set fillchars+=vert:│
set diffopt+=foldcolumn:0

set t_Co=256
set bg=dark

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

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Base

Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'morhetz/gruvbox'

" Syntax & lang

"Plug 'w0rp/ale' " check syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'sheerun/vim-polyglot'

"Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css', 'php'] } " C-y ,
Plug 'gko/vim-coloresque', { 'for': ['css','scss'] } " css color
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'phtml', 'xml']}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': ['php']}

call plug#end()

" }}}

color gruvbox

" Plugin settings

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:coc_global_extensions = 'coc-json coc-css coc-phpls coc-html coc-yaml coc-emmet coc-sql'


" Mappings

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
map <tab> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>, :noh<CR>
noremap <Leader>/ :Commentary<CR>
nmap <leader><tab> :FZF<cr>
map <leader>l :set list!<CR>
map <F3> :DBUIToggle<CR>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>
map <S-Tab> <C-W>W

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <C-]> <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Autocmds

" File type specific indenting
autocmd FileType c,make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType css,markdown,python,php setlocal shiftwidth=4 softtabstop=4 tabstop=4

" custom

if executable('rg')
  set grepprg=set grepprg=rg\ --no-heading\ --vimgrep
endif

" vim:foldmethod=marker:foldlevel=0

