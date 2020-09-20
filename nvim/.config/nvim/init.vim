" ==================== 
" Author: fagci
" Description: My neovim config for frontend web development
" ====================

let loaded_matchit=1
let g:loaded_netrw=1
let g:loaded_netrwPlguin=1

" ======================================== 
" Plugins
" ======================================== 

" Vim-Plug install if not
let s:plug_autoload_path = "~/.config/nvim/autoload/plug.vim"
let s:plug_download_url  = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
if !filereadable(expand(s:plug_autoload_path))
    silent exec "!curl -fLo " . fnameescape(s:plug_autoload_path) . " --create-dirs " . s:plug_download_url
    silent exec "so " . fnameescape(s:plug_autoload_path)
endif

call plug#begin("~/.config/nvim/plugged")

Plug 'tweekmonster/startuptime.vim'

" Project navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'                 " Distraction free writing

" Language-specific
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-dadbod'
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}

" Syntax hl
Plug 'nelsyeung/twig.vim', {'for': 'twig'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'StanAngeloff/php.vim', {'for': 'php'}

" LSP, completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" Utils
Plug 'vimwiki/vimwiki'
" Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'andymass/vim-matchup'
Plug 'vifm/vifm.vim'
Plug 'yuratomo/w3m.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

filetype plugin indent on
syntax on

" ======================================== 
" Options
" ======================================== 

" Base
set modeline
let mapleader=','
let maplocalleader=','
set encoding=utf-8
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
set nonumber
set signcolumn=yes
set scrolloff=5
set noerrorbells visualbell t_vb=
set shortmess=I
set shortmess+=c
set splitbelow splitright
set termguicolors
set listchars=tab:▸\ ,space:.,trail:•

" Editing
set nowrap
set clipboard+=unnamedplus
set backspace=start,eol,indent
set smartindent
set expandtab smarttab
set formatoptions=tcqrn1
set shiftwidth=4           " Spaces for each (auto)indent.
set softtabstop=4          " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=4              " Spaces that a <Tab> in file counts for.

" Search
set ignorecase incsearch hlsearch smartcase

" Statusline
set stl=[%n]%{&paste?'\ PASTE':''}\  
set stl+=%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%)
" set stl+=%(\ \|\ %{GitBranch()}%)
set stl+=%(\ \|\ %{coc#status()}%)
set stl+=%=%l:%c/%L\ %y

" Speedup
set nocursorline nocursorcolumn norelativenumber
set ttyfast
set lazyredraw
set updatetime=150
set regexpengine=1
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen
set timeoutlen=1000 ttimeoutlen=0  " remove delay on mode change
set regexpengine=0
set noshowmatch
let g:loaded_matchparen=1


if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore --smart-case --glob "!.git/*"'
endif


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


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! GitBranch()
  return system("git branch --show-current 2>/dev/null | tr -d '\n'")
endfunction

function! DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl 
    endif
endfunction

function! OnlineDoc()
  let s:wordUnderCursor = expand("<cword>")
  execute 'W3m' &ft s:wordUnderCursor
endfunction

" ======================================== 
" Mappings
" ======================================== 

nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>, :noh<CR>

" Online doc search.
map <silent> <M-d> :call OnlineDoc()<CR>

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
map <Leader>vs :VsplitVifm<CR> 

" Goyo
nnoremap <silent> <leader>gy :Goyo<CR>

" Vim-plug

nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pr :PlugClean<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>
nnoremap <silent> <leader>ps :PlugStatus<CR>
nnoremap <silent> <leader>pd :PlugDiff<CR>
nnoremap <silent> <leader>ph :PlugSnapshot

nnoremap <tab> :GFiles --cached --others --exclude-standard<cr>
nnoremap <Leader><tab> :Files<CR>
nnoremap <Leader>f :GRG<CR>
nnoremap <Leader>F :RG<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>b :Buffers<CR>

" COC

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


" Jump between snippet placeholders
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>.  <Plug>(coc-fix-current)

nmap <leader>es :CocCommand snippets.editSnippets<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" ======================================== 
" Autocommands
" ======================================== 

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

augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END

" Highlight the symbol and its references when holding the cursor.
augroup HLSymbolOnCursorHold
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup FZF
    au! FileType fzf set noshowmode noruler nonu nornu
augroup END

" ======================================== 
" Variables
" ======================================== 

let g:php_sql_heredoc = 1
let g:php_sql_nowdoc = 1
let g:php_html_in_heredoc = 1
let g:php_html_in_nowdoc = 1

let g:vue_pre_processors = []

" Used on most machines
let g:coc_global_extensions = ['coc-git', 'coc-sh', 'coc-pairs', 'coc-diagnostic', 'coc-marketplace', 'coc-snippets', 'coc-vimlsp']

" Also using
"   coc-css coc-stylelint coc-emmet coc-eslint coc-html coc-json coc-phpls coc-prettier 
"   coc-sql coc-tslint-plugin coc-tsserver coc-vetur coc-yaml 

let g:rg_derive_root = 1

let g:vifm_replace_netrw=1

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'fzf']


" ======================================== 
" Colors
" ======================================== 

let gruvbox_transp_bg=v:true
color gruvbox8_hard
" color base16-default-dark
" color base16-bright

hi! Normal guibg=NONE ctermbg=NONE
hi! LineNr guibg=NONE ctermbg=NONE ctermfg=239 guifg=#666666
hi! SignColumn guibg=NONE ctermbg=NONE
hi!   StatusLine         gui=NONE      guifg=#ffffff guibg=NONE
hi!   SpecialKey         ctermfg=239   guifg=#666666
hi!   IndentGuidesOdd    ctermbg=236   guibg=#282828
hi!   IndentGuidesEven   ctermbg=235   guibg=#323232

hi! DiffAdd ctermbg=none ctermfg=green gui=none guibg=none guifg=green
hi! DiffDelete ctermbg=none ctermfg=red gui=none guibg=none guifg=darkred
hi! DiffChangeDelete ctermbg=none ctermfg=grey gui=none guibg=none guifg=grey
hi! DiffChange ctermbg=none ctermfg=grey gui=none guibg=none guifg=grey
hi! CocWarningSign guifg=#ffff00


