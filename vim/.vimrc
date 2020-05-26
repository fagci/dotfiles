" ===========================
" VIMRC
" ===========================
"
" @author fagci
"
" ===========================

set encoding=utf-8

" Install plugin manager

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins

call plug#begin('~/.vim/plugged')

" Base

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'

" Syntax & lang

Plug 'w0rp/ale' " check syntax

Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css', 'php'] } " C-y ,
Plug 'gko/vim-coloresque' " css color
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'xml']}

call plug#end()


" Base settings

syntax on
set lazyredraw
set number
set relativenumber
set cursorline
set nobackup
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set visualbell
set scrolloff=4
set colorcolumn=80,120
set history=10000
set undolevels=200

set softtabstop=2
set shiftwidth=2

set modelines=0 " security

let mapleader=","

" Theme

color gruvbox
set bg=dark

" Mappings
map <tab> :NERDTreeToggle<CR>
noremap <Leader>/ :Commentary<CR>
nmap <leader><tab> :FZF<cr>
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Autocmds

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb,es6,py autocmd BufWritePre <buffer> %s/\s\+$//e

