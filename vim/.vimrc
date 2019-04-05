set nocompatible
filetype off

" load vim plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" project file tree
Plug 'scrooloose/nerdtree'

" enhanced status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" dims inactive splits
Plug 'blueyed/vim-diminactive'

" search project by file path/name
Plug 'ctrlpvim/ctrlp.vim'

" rapid code nav
Plug 'easymotion/vim-easymotion'

" auto closes quotes and braces
Plug 'jiangmiao/auto-pairs'

" auto closes XML tags
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'javascript'] }

" consistent coding style
Plug 'editorconfig/editorconfig-vim'

" search in a project
Plug 'rking/ag.vim'

" async linting
"Plug 'w0rp/ale'

" tab completion
Plug 'ervandew/supertab'
Plug 'antonk52/vim-tabber'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" change surrounding chars
Plug 'tpope/vim-surround'

" =====================
" HTML

" quick html
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] }


" =========== syntax ===========
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-liquid'
Plug 'maksimr/vim-yate'
Plug 'chase/vim-ansible-yaml'
Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'javascript', 'javascript.jsx'] }
Plug 'Yggdroot/indentLine'
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }

" themes
Plug 'flazz/vim-colorschemes'
Plug 'wincent/terminus'



" ====================

" git gems
Plug 'tpope/vim-fugitive'

call plug#end()
filetype plugin indent on



" theme
syntax enable
set background=dark
if has('termguicolors')
  set termguicolors
endif

" highlight current cursor line
set cursorline

" Access colors present in 256 colorspace
let base16colorspace=256

color gruvbox

" show current line number
set number
set relativenumber

" search made easy
set nohlsearch
set incsearch

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2

" use spaces instead of tabs
set expandtab

" always indent by multiple of shiftwidth
set shiftround

" indend/deindent at the beginning of a line
set smarttab

" draw less
set lazyredraw

" never ring the bell for any reason
if exists('&belloff')
  set belloff=all
endif

" break long lines on breakable chars
" instead of the last fitting character
set linebreak

" always keep 3 lines around the cursor
set scrolloff=3
set sidescrolloff=3

" always show status line
set laststatus=2

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

" separators
let g:airline_left_sep = ''
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
" truncate branch name prefix
let g:airline#extensions#branch#format = 2
" performance lol
let g:airline_highlighting_cache = 1
let g:airline_skip_empty_sections = 1
" only show line and column numbers
let g:airline_section_z = '%l:%v'
" do not show utf-8
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" disable word count
let g:airline#extensions#wordcount#enabled = 0
" use ale by default
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'Err:'
let airline#extensions#ale#warning_symbol = 'Warn:'

" do not notify when spell is on
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0

" hide filetype by default
let g:airline_section_x = ''

" be able to toggle filetype display
function! ToggleFiletype()
  if (g:airline_section_x == '')
    let g:airline_section_x = &filetype
  else
    let g:airline_section_x = ''
  endif
  :AirlineRefresh
endfunction



" ======= Nerdtree

" toggle nerdtree with CTRL N
map <C-N> :NERDTreeToggle<CR>
" show dot files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.DS_Store']


" ======= Ctrlp

" runtime path for fizzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_root_markers=['package.json']



let g:deoplete#enable_at_startup = 1


" ======= closetag

" file extensions where this plugin is enabled
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts,*.tsx"
" make the list of non-closing tags self-closing in the specified files
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'

