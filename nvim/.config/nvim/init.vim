" ======================================== 
" Author: fagci
" CreationDate: 2021-06-28
" ======================================== 

" Speedup
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1

set lazyredraw
set updatetime=300
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen
set ttimeoutlen=0  " remove delay on mode change
set synmaxcol=300
" old regex for large files
if line('$') > 1000
    set re=1
endif

" Base
let mapleader=','
let maplocalleader=','
set langmenu=en_US.utf-8
language message en_US.UTF-8

" Backup, history, undo
set noswapfile nobackup nowritebackup
set undodir=~/.vimundo
if (!isdirectory(expand(&undodir)))
    call mkdir(expand(&undodir), 'p')
endif
set undofile

" UI
set number
set signcolumn=number
set scrolloff=5
set sidescrolloff=5
set splitbelow splitright
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set listchars=tab:▸\ ,space:.,trail:•

" Editing
set nowrap
set clipboard+=unnamedplus
set smartindent
set expandtab
set formatoptions=tcqrn1
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" Search
set ignorecase incsearch hlsearch smartcase
set inccommand=nosplit " live substitution

" Statusline
set stl=[%n]%{&paste?'\ PASTE':''}\  
set stl+=%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%)
" set stl+=%(\ [%{coc#status()}]%)
set stl+=%=%l:%c/%L\ %y

set shortmess+=c

" Install VIM-Plug if not
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'honza/vim-snippets'

" Utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'vifm/vifm.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-dadbod'

" HL
Plug 'pangloss/vim-javascript', {'for': 'javascript'}

" UI
" Plug 'gruvbox-community/gruvbox'
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

" ======================================== 
" Functions
" ======================================== 

command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --fixed-strings --no-ignore --smart-case --glob "!.git/*" -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* GRG
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --glob "!.git/*" -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" ======================================== 
" Mappings
" ======================================== 

nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>, :noh<CR>

nnoremap ; :

map <leader>l :set list!<CR>

nnoremap <Leader>s :set spell!<cr>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>

" Navigate windows
nnoremap <C-LEFT> <C-w>h
nnoremap <C-DOWN> <C-w>j
nnoremap <C-UP> <C-w>k
nnoremap <C-RIGHT> <C-w>l

" Move lines
nnoremap <A-DOWN> :m .+1<CR>==
nnoremap <A-UP> :m .-2<CR>==
inoremap <A-DOWN> <Esc>:m .+1<CR>==gi
inoremap <A-UP> <Esc>:m .-2<CR>==gi
vnoremap <A-DOWN> :m '>+1<CR>gv=gv
vnoremap <A-UP> :m '<-2<CR>gv=gv

" Resize windows
noremap <silent> <C-S-Left> :vertical resize -1<CR>
noremap <silent> <C-S-Right> :vertical resize +1<CR>
noremap <silent> <C-S-Up> :resize +1<CR>
noremap <silent> <C-S-Down> :resize -1<CR>

nnoremap <leader>q :bp<bar>bd#<cr>
nnoremap <leader>Q :bp!<bar>bd!#<cr>

" toggle colorcolumn with ,|
nnoremap <silent> <leader><bar> :execute "set colorcolumn="
            \ . (&colorcolumn == "" ? "80" : "")<CR>

noremap <Leader>/ :Commentary<CR>

" Vifm
map <Leader>vv :Vifm<CR> 

" Vim-plug
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>

nnoremap <tab> :GFiles --cache<cr>
nnoremap <Leader><tab> :Files<CR>
nnoremap <Leader>f :GRG<CR>
nnoremap <Leader>F :RG<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>b :Buffers<CR>

" COC -------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when press '*' in normal mode
" augroup cursorHighlight
"   autocmd! CursorHold * silent call CocActionAsync('highlight')
" augroup END

augroup ScrollToLastSeenLocationOnFileOpen
    autocmd! BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END


let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-pairs',
            \ 'coc-snippets',
            \ 'coc-pyright',
            \ 'coc-sh',
            \ 'coc-vimlsp',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-diagnostic']

colorscheme gruvbox8
