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

let mapleader=","
set encoding=utf-8

set backspace=indent,eol,start
set colorcolumn=80
set clipboard+=unnamedplus
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
set background=dark
set termguicolors
set t_ut="" " fixes weird bg over line
set showtabline=2
set guioptions-=e
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

"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Search & replace

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

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
" Plug 'sainnhe/gruvbox-material'
Plug 'srcery-colors/srcery-vim'
Plug 'Yggdroot/indentLine'

" Linters, autocompletions

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'SirVer/ultisnips' " py3 error
Plug 'honza/vim-snippets'

" Syntax & lang

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-dadbod'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-liquid'
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'

Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'stylus', 'less'] } " css color
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'phtml', 'xml']}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': ['php']}
Plug 'captbaritone/better-indent-support-for-php-with-html', {'for': 'php'} " TESTING

" Utils

Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" }}}

" {{{ Plugin settings

let g:rg_derive_root = 1
let g:fzf_command_prefix = 'Fzf'

let g:lightline = {
      \ 'colorscheme': 'srcery',
            \ 'component': {
            \   'readonly': '%{&readonly?"":""}',
            \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
let g:lightline.active = {
      \   'left': [
      \     ['mode', 'paste'],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ],
      \     ['gitinfo']
      \   ],
      \   'right': [
      \     ['lineinfo', 'filetype'],
      \     ['percent'],
      \     ['fileformat', 'fileencoding'],
      \   ],
      \ }
let g:lightline.inactive = {
      \   'left': [
      \     ['paste'],
      \     ['readonly', 'filename', 'modified'],
      \   ],
      \   'right': [
      \     ['lineinfo', 'filetype'],
      \     ['percent'],
      \   ],
      \ }
let g:lightline.tabline = {'left': [['buffers']], 'right':[]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1

let g:coc_git_status = 0

let g:coc_global_extensions = [
      \   'coc-pairs',
      \   'coc-snippets',
      \   'coc-css',
      \   'coc-eslint',
      \   'coc-html',
      \   'coc-emmet',
      \   'coc-sql',
      \   'coc-json',
      \   'coc-phpls',
      \   'coc-tslint-plugin',
      \   'coc-tsserver',
      \   'coc-yaml',
      \ ]
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
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeWinSize = 25
let NERDTreeIgnore=['.vscode', '.idea', '\~$', '^\.git$']

let g:indentLine_char_list = ['⎸']

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_material_background = 'hard'

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

command! -bar CBCopy !xclip -f -sel clip
command! -bar CBPaste r!xclip -o -sel clip

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

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

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

vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip

" }}}

" Autocmds {{{

" File type specific indenting

autocmd FileType c,make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType css,markdown,python,php setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType vim setlocal foldmethod=marker

augroup nerdtree
  autocmd!
  autocmd FileType nerdtree syntax clear NERDTreeFlags
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal signcolumn=no
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

" }}}

" Custom {{{

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif

" color gruvbox-material
color srcery

" }}}

