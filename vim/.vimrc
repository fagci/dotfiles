" ===========================================
"
" .vimrc VIM config file
"
" Author: fagci <fagci.nsk@gmail.com>
"
" ===========================================

" Common setup {{{

set nocompatible
set modelines=1
set encoding=UTF-8

set ttyfast
set lazyredraw " draw less
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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

" }}}

" {{{ Plugins
filetype off

if empty(glob('~/.vim/autoload/plug.vim')) " load vim plug if it is not installed
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes' " themes
Plug 'wincent/terminus'

Plug 'christoomey/vim-system-copy'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'keith/investigate.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }             " project file tree
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'                                      " enhanced status line
Plug 'vim-airline/vim-airline-themes'
Plug 'sk1418/HowMuch'
Plug 'godlygeek/tabular'
Plug 'blueyed/vim-diminactive'                                      " dims inactive splits
Plug 'jiangmiao/auto-pairs'                                         " auto closes quotes and braces
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'javascript'] } " auto closes XML tags
Plug 'editorconfig/editorconfig-vim'                                " consistent coding style
" Plug 'rking/ag.vim'                                                 " search in a project
"Plug 'ervandew/supertab'                                            " tab completion
Plug 'antonk52/vim-tabber'


" Deoplete {{{
" NOTE: on Arch linux install greenlet from repo, remove pip version
" Additional dependency: pip3 install --user pynvim

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

" }}}

Plug 'tpope/vim-surround' " change surrounding chars

if has('python')
  Plug 'Valloric/MatchTagAlways'
endif

" Syntax {{{

Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript'] } " quick html
Plug 'othree/html5.vim', {'for': ['html']} "HTML5 omnicomplete and syntax
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'hail2u/vim-css3-syntax', { 'for': ['html','css'] }
Plug 'pangloss/vim-javascript',      { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script', {'for': ['coffee']}
Plug 'chase/vim-ansible-yaml', {'for': ['yaml','yml']}
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }

" }}}

Plug 'Yggdroot/indentLine'

" Git {{{

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" }}}

call plug#end()
filetype plugin indent on

" }}}

" {{{ Command aliases

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

let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256

color gruvbox
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2

" }}}

" {{{ Spell check

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red ctermbg=black
" set spell spelllang=en_us

" }}}

" Plugin settings {{{

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump           = 1
let g:syntastic_error_symbol        = '✖'
let g:syntastic_warning_symbol      = '►'

let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_html_checkers=['tidy']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_yaml_checkers=['js-yaml']
let g:syntastic_scss_checkers=['scss-lint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_handlebars_checkers=['handlebars']
let g:syntastic_tpl_checkers=['handlebars']
let g:syntastic_javascript_checkers = ['jshint'   ] " sudo npm install -g jshint
let g:syntastic_html_checkers       = ['jshint'   ] " sudo npm install -g jshint
let g:syntastic_haml_checkers       = ['haml-lint'] " gem install haml-lint
let g:syntastic_css_checkers        = ['csslint'  ] " sudo npm install -g csslint
let g:syntastic_css_csslint_args    = "--ignore=zero-units"

" multiple cursor

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<esc>'

" ======= Nerdtree

let NERDTreeShowHidden=1 " show dot files
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
" git indicator in tree
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

" ======= closetag

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'

" emmet
let g:user_emmet_expandabbr_key='<Tab>'

let g:used_javascript_libs = 'jquery,lodash,vue,angularjs'
let javascript_enable_domhtmlcss = 1
let g:html_indent_inctags        = "html,body,head,tbody"
let g:html_indent_script1        = "inc"
let g:html_indent_style1         = "inc"

" Deoplete
let g:deoplete#enable_at_startup = 1

" }}}

" {{{ Mappings

map <c-n> :NERDTreeToggle<cr>
let mapleader = " "

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <F1> :call investigate#Investigate()<CR>

" }}}

" vim:fdm=marker:fdl=0
