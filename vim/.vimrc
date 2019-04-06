set nocompatible

set ttyfast
set lazyredraw " draw less
set cul

set foldmethod=marker
set number
set relativenumber
set hlsearch
set incsearch

set linebreak " break long lines on breakable chars

set scrolloff=3 " always keep 3 lines around the cursor
set sidescrolloff=3

set laststatus=2 " always show status line

" {{{ Plugins
filetype off

if empty(glob('~/.vim/autoload/plug.vim')) " load vim plug if it is not installed
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'                                          " project file tree
Plug 'vim-airline/vim-airline'                                      " enhanced status line
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'blueyed/vim-diminactive'                                      " dims inactive splits
Plug 'ctrlpvim/ctrlp.vim'                                           " search project by file path/name
Plug 'easymotion/vim-easymotion'                                    " rapid code nav
Plug 'jiangmiao/auto-pairs'                                         " auto closes quotes and braces
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'javascript'] } " auto closes XML tags
Plug 'editorconfig/editorconfig-vim'                                " consistent coding style
Plug 'rking/ag.vim'                                                 " search in a project
Plug 'ervandew/supertab'                                            " tab completion
Plug 'antonk52/vim-tabber'

Plug 'tpope/vim-surround' " change surrounding chars

" HTML " =====================

Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] } " quick html

Plug 'morhetz/gruvbox' " =========== syntax ===========
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-liquid'
Plug 'maksimr/vim-yate'
Plug 'chase/vim-ansible-yaml'
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'javascript', 'javascript.jsx'] }
Plug 'Yggdroot/indentLine'
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'flazz/vim-colorschemes' " themes
Plug 'wincent/terminus'

" ====================

Plug 'tpope/vim-fugitive' " git gems

call plug#end()
filetype plugin indent on

" }}}

" {{{ Commands

" ======= fat fingers

command! Wq :wq
command! Ter :ter
command! Sp :sp
command! Vs :vs

" }}}

" {{{ Styling

syntax enable
set background=dark
if has('termguicolors')
  set termguicolors
endif

set cursorline " highlight current cursor line

let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256

color gruvbox
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2

" }}}

" {{{ Tab characters

set tabstop=2    " 1 tab == 2 spaces
set shiftwidth=2
set expandtab    " use spaces instead of tabs
set shiftround   " always indent by multiple of shiftwidth
set smarttab     " indend/deindent at the beginning of a line

" }}}

" {{{ Spell check

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red ctermbg=black
" set spell spelllang=en_us
" }}}

" ======= Nerdtree

let NERDTreeShowHidden=1 " show dot files

" ======= Ctrlp

set runtimepath^=~/.vim/bundle/ctrlp.vim " runtime path for fizzy search
let g:ctrlp_root_markers=['package.json']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|vendor|node_modules',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
set wildignore+=*\\vendor\\**
" ======= closetag

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'

if exists('&belloff') " never ring the bell for any reason
  set belloff=all
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" {{{ Mappings
map <C-N> :NERDTreeToggle<CR> 
" }}}

