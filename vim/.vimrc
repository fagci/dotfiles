set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim')) " load vim plug if it is not installed
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " project file tree
Plug 'vim-airline/vim-airline' " enhanced status line
Plug 'vim-airline/vim-airline-themes'
Plug 'blueyed/vim-diminactive' " dims inactive splits
Plug 'ctrlpvim/ctrlp.vim' " search project by file path/name
Plug 'easymotion/vim-easymotion' " rapid code nav
Plug 'jiangmiao/auto-pairs' " auto closes quotes and braces
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'javascript'] } " auto closes XML tags
Plug 'editorconfig/editorconfig-vim' " consistent coding style
Plug 'rking/ag.vim' " search in a project
Plug 'ervandew/supertab' " tab completion
Plug 'antonk52/vim-tabber'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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

syntax enable " theme
set background=dark
if has('termguicolors')
  set termguicolors
endif

set cursorline " highlight current cursor line

let base16colorspace=256 " Access colors present in 256 colorspace

color gruvbox

set number " show current line number
set relativenumber

set hlsearch " search made easy
set incsearch

set tabstop=2 " 1 tab == 2 spaces
set shiftwidth=2

set expandtab " use spaces instead of tabs

set shiftround " always indent by multiple of shiftwidth

set smarttab " indend/deindent at the beginning of a line

set lazyredraw " draw less

if exists('&belloff') " never ring the bell for any reason
  set belloff=all
endif

" instead of the last fitting character " break long lines on breakable chars
set linebreak

set scrolloff=3 " always keep 3 lines around the cursor
set sidescrolloff=3

set laststatus=2 " always show status line

" set spell spelllang=ru_ru,en_us

" ======= fat fingers

command! Wq :wq
command! Ter :ter
command! Sp :sp
command! Vs :vs




" ======= Deoplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 2

" ======= Airline

let g:airline_left_sep = '' " separators
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#branch#format = 2 " truncate branch name prefix
let g:airline_highlighting_cache = 1 " performance lol
let g:airline_skip_empty_sections = 1
let g:airline_section_z = '%l:%v' " only show line and column numbers
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " do not show utf-8
let g:airline#extensions#wordcount#enabled = 0 " disable word count
let g:airline#extensions#ale#enabled = 1 " use ale by default
let airline#extensions#ale#error_symbol = 'Err:'
let airline#extensions#ale#warning_symbol = 'Warn:'

let g:airline_detect_spell=0 " do not notify when spell is on
let g:airline_detect_spelllang=0

let g:airline_section_x = '' " hide filetype by default

function! ToggleFiletype() " be able to toggle filetype display
  if (g:airline_section_x == '')
    let g:airline_section_x = &filetype
  else
    let g:airline_section_x = ''
  endif
  :AirlineRefresh
endfunction



" ======= Nerdtree

map <C-N> :NERDTreeToggle<CR> " toggle nerdtree with CTRL N
let NERDTreeShowHidden=1 " show dot files
let NERDTreeIgnore=['\.swp$', '\.DS_Store']


" ======= Ctrlp

set runtimepath^=~/.vim/bundle/ctrlp.vim " runtime path for fizzy search
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_root_markers=['package.json']



let g:deoplete#enable_at_startup = 1


" ======= closetag

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts,*.tsx" " file extensions where this plugin is enabled
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx' " make the list of non-closing tags self-closing in the specified files

