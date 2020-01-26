" ===========================================
"
" Author: fagci <fagci.nsk@gmail.com>
"
" Prerequisites:
"
" pip3 install pynvim
" npm install -g neovim tern
"
" ===========================================

" Common setup {{{

set nocompatible
set modelines=1
set encoding=UTF-8

set ttyfast
set lazyredraw " draw less
set updatetime=300
set cul

set noswapfile
set nobackup
set nowb

set foldmethod=marker
set number
set relativenumber
set hlsearch
set incsearch

set linebreak " break long lines on breakable chars

set scrolloff=3 " always keep 3 lines around the cursor
set sidescrolloff=3

set laststatus=2 " always show status line

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

if exists('&belloff') " never ring the bell for any reason
  set belloff=all
endif

" {{{ Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" }}}

" for vertical pane in git diff tool
set diffopt+=vertical

" }}}

" {{{ Plugins

filetype off

" {{{ Install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim')) " load vim plug if it is not installed
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" {{{ Plugins here
call plug#begin('~/.nvim/plugged')

" === General
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Shougo/deoplete.nvim'
Plug 'dense-analysis/ale'

" formatting / editing
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'

" search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'henrik/vim-indexed-search'
Plug 'wincent/ferret' " multisearch in current directory / multi replace

" notes
Plug 'xolox/vim-misc', {'on': 'Note'}
Plug 'xolox/vim-notes', {'on': 'Note'}

" usability / style
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'blueyed/vim-diminactive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim' " status line
"Plug 'maximbaz/lightline-ale'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" git
Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" === Syntax

" - md
Plug 'junegunn/goyo.vim', { 'for': 'markdown' } " Distraction-free
Plug 'junegunn/limelight.vim', { 'for': 'markdown' } " Hyperfocus-writing

" php
"Plug 'StanAngeloff/php.vim', {'for': 'php'}
"Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
"Plug 'nishigori/vim-php-dictionary', {'for': 'php'}

" php refactoring options
"Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
"Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
"Plug '2072/php-indenting-for-vim', {'for': 'php'}

" php doc autocompletion
"Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx', 'vue'], 'do': 'npm install'}
Plug 'HerringtonDarkholme/yats.vim'

Plug 'leafgarland/typescript-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" vue
Plug 'posva/vim-vue'

" -
Plug 'hail2u/vim-css3-syntax'
Plug 'chr4/nginx.vim'
Plug 'stephpy/vim-yaml'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ap/vim-css-color'

call plug#end()

" }}}

" {{{ Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall
endif
" }}}

filetype plugin indent on

" {{{ Plugin settings

let g:airline_powerline_fonts = 1

let g:deoplete#enable_at_startup = 1

" Enable JSDoc highlighting
let g:javascript_plugin_jsdoc = 1

" {{{ Ale

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_sign_info = 'ℹ'

let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_statusline_format = [g:ale_sign_error.'%d', g:ale_sign_warning.'%d', '⬥ ok']
let g:ale_echo_msg_error_str = g:ale_sign_error
let g:ale_echo_msg_warning_str = g:ale_sign_warning

"let g:ale_linters = {
"\   'javascript': ['eslint', 'prettier'],
"\   'typescript': ['eslint', 'tsserver'],
"\   'php': ['php -l'],
"\   'html': []
"\  }

"let g:ale_fixers = {
"\   'javascript': ['eslint'],
"\   'typescript': ['eslint'],
"\   'typescriptreact': ['eslint'],
"\   }

" }}}

" {{{ FZF


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' 
  \ }
" }}}

" {{{ Ferret
nmap <leader>s <Plug>(FerretAck)
nmap <leader>S <Plug>(FerretAckWord)
let g:FerretMap=0
" }}}

" {{{ NERDTree

" don't display informations (type ? for help and so on)
let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeQuitOnOpen = 1

" change the arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" remapping - see nerdtree.txt and search for "NERDTreeMappings"
let NERDTreeMapOpenSplit = 'b'
let NERDTreeMapPreviewSplit='gb'

let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapPreviewVSplit='gv'
let g:NERDTreeMouseMode=3

" }}}

" {{{ Ultisnips
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Delete in select mode (when tabstopping)
smap <C-d> <Del>
" }}}

" {{{ multiple cursor

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<esc>'

" }}}




" }}}

" }}}

" {{{ Mapping

" ======= fat fingers

command! Wq :wq
command! Ter :ter
command! Sp :sp
command! Vs :vs

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gu :Gpull<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Git<space>add<space>-v<space>.<cr>
nnoremap <leader>go :Git<space>checkout<space>
nnoremap <leader>gb :Git<space>checkout<space>-b<space>
nnoremap <leader>gx :Git<space>

" surround by quotes - frequently use cases of vim-surround
map <leader>" ysiw"<cr>
map <leader>' ysiw'<cr>

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>

" windows creation
" create horizontal window
nnoremap <leader>wh <c-w>s
" create vertival window
nnoremap <leader>wv <c-w>v

nnoremap <c-n> :NERDTreeToggle<cr>
nnoremap <c-p> :Files<CR>
nmap <leader>d <Plug>(ale_fix)

" }}}

" {{{ Autocmd
" delete trailing space when saving files
autocmd BufWrite *.php,*.js,*.jsx,*.vue,*.twig,*.html,*.sh,*.yaml,*.yml :call general#DeleteTrailingWS()
" Open images with feh
autocmd BufEnter *.png,*.jpg,*gif silent! exec "! feh ".expand("%") | :bw

" }}}

" {{{ Style
set termguicolors
set laststatus=2
colorscheme gruvbox
set background=dark

" }}}

