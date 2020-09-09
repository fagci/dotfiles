if empty(glob('~/.config/nvim/autoload/plugpac.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plugpac.vim --create-dirs https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim
  silent !git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
  autocmd VimEnter * PackInstall
endif

call plugpac#begin()
Pack 'airblade/vim-gitgutter'
Pack 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Pack 'tpope/vim-commentary'
Pack 'tpope/vim-fugitive'
Pack 'tpope/vim-surround'
Pack 'Shougo/neosnippet.vim'
Pack 'Shougo/neosnippet-snippets'
Pack 'junegunn/fzf'
Pack 'junegunn/fzf.vim'
Pack 'ryanoasis/vim-devicons'
Pack 'kshenoy/vim-signature'
Pack 'editorconfig/editorconfig-vim'
Pack 'vimwiki/vimwiki'
Pack 'markonm/traces.vim' " range, pattern, substitute preview
Pack 'prabirshrestha/async.vim'
Pack 'prabirshrestha/asyncomplete.vim'
Pack 'prabirshrestha/asyncomplete-lsp.vim'
Pack 'prabirshrestha/vim-lsp'
Pack 'mattn/vim-lsp-settings'
Pack 'prabirshrestha/asyncomplete-emmet.vim'
Pack 'prabirshrestha/asyncomplete-emoji.vim'
Pack 'prabirshrestha/asyncomplete-file.vim'
Pack 'prabirshrestha/asyncomplete-neosnippet.vim'
Pack 'prabirshrestha/asyncomplete-omni.vim'
call plugpac#end()

filetype plugin indent on
syntax on

let loaded_matchit=1
let mapleader=','
let maplocalleader=','
set encoding=utf-8
set langmenu=en_US.utf-8
language message en_US.UTF-8

set backspace=start,eol,indent
set noswapfile

set number
set signcolumn=yes
set nowrap
set showmatch
set scrolloff=5
set clipboard+=unnamedplus
set noerrorbells visualbell t_vb=

set smartindent
set expandtab smarttab
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

set splitbelow splitright
set listchars=tab:▸\ ,space:.,trail:•

set wildmenu
set wildmode=longest:full,full

set termguicolors

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" statusline
set stl=[%n]%{&paste?'\ PASTE':''}\  
set stl+=%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%)
set stl+=%(\ \|\ %{FugitiveHead()}%)
" set stl+=%(\ \|\ %{coc#status()}%)
set stl+=%=%{&fenc}\ %l:%c/%L\ %y

" speedup
set nocursorline nocursorcolumn norelativenumber
set ttyfast
set lazyredraw
set updatetime=150
set regexpengine=1
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen
set timeoutlen=1000 ttimeoutlen=0  " remove delay on mode change

" Functions

command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Mappings

nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>, :noh<CR>

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

map <tab> :NERDTreeToggle<CR>
noremap <Leader>/ :Commentary<CR>

nnoremap <silent> <leader>pi :PackInstall<CR>
nnoremap <silent> <leader>pu :PackUpdate<CR>
nnoremap <silent> <leader>pc :PackClean<CR>
nnoremap <silent> <leader>ps :PackStatus<CR>

nnoremap <leader><tab> :GFiles --cached --others --exclude-standard<cr>
nnoremap <Leader>F :RG<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>H :History<CR>
nnoremap <Leader>b :Buffers<CR>

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


augroup Completion
    au!
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
        \ 'name': 'emmet',
        \ 'whitelist': ['html'],
        \ 'completor': function('asyncomplete#sources#emmet#completor'),
        \ }))

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
        \ 'name': 'emoji',
        \ 'whitelist': ['*'],
        \ 'priority': 1,
        \ 'completor': function('asyncomplete#sources#emoji#completor'),
        \ }))

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'whitelist': ['*'],
        \ 'priority': 10,
        \ 'completor': function('asyncomplete#sources#file#completor')
        \ }))
    " buggy
    " au User asyncomplete_setup call  asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    "     \ 'name': 'omni',
    "     \ 'whitelist': ['*'],
    "     \ 'blacklist': ['c', 'cpp', 'html'],
    "     \ 'completor': function('asyncomplete#sources#omni#completor'),
    "     \ 'config': {
    "     \   'show_source_kind': 1
    "     \ }
    "     \ }))
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
        \ 'name': 'neosnippet',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
        \ }))
augroup END


" Autocommands

silent !stty -ixon

augroup Ixon
    autocmd! VimLeave * silent !stty ixon
augroup END

augroup ScrollToLastSeenLocationOnFileOpen
    autocmd! BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END

function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl 
    endif
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END


if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif







" lsp init
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:asyncomplete_popup_delay = 500
let g:asyncomplete_auto_popup = 1

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_highlight_references_enabled = 1

let g:lsp_signs_error = {'text': 'X'}
let g:lsp_signs_warning = {'text': '!'}
let g:lsp_signs_hint = {'text': '?'}



let gruvbox_transp_bg=v:true
color gruvbox8_hard
highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine
