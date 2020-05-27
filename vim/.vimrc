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

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Base

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret' " :Ack -> :Acks /A/B/
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim' " more entities (ex.: di,)
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'qpkorr/vim-bufkill' " :BD

Plug 'osyo-manga/vim-over' " show regex as u type it

Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'morhetz/gruvbox'

" Syntax & lang

Plug 'w0rp/ale' " check syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css', 'php'] } " C-y ,
Plug 'gko/vim-coloresque' " css color
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'phtml', 'xml']}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': ['php']}

call plug#end()

" }}}

" Plugin settings

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:UltiSnipsExpandTrigger='<Nop>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Base settings

syntax on
filetype plugin indent on

set lazyredraw
set updatetime=300
set number
set relativenumber
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set visualbell
set laststatus=2
set scrolloff=4
set colorcolumn=80,120
set foldenable
set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
set smartindent
set wildmenu

set nobackup
set noswapfile
set undofile
set undodir=/tmp/.vim_undo
set undolevels=1000
set undoreload=10000

set modelines=0 " security
set backspace=indent,eol,start

let mapleader=","

" Theme

set t_Co=256
color gruvbox
set bg=dark

" Mappings

nnoremap <silent> <Leader>, :noh<CR>
map <tab> :NERDTreeToggle<CR>
noremap <Leader>/ :Commentary<CR>
nmap <leader><tab> :FZF<cr>
map <leader>l :set list!<CR> " Toggle tabs and EOL
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
map <F3> :DBUIToggle<CR>

map <leader>" ysiw"<cr>
map <leader>' ysiw'<cr>

vmap < <gv
vmap > >gv

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>
map <S-Tab> <C-W>W

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Autocmds

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb,es6,py autocmd BufWritePre <buffer> %s/\s\+$//e


" vim:foldmethod=marker:foldlevel=0

