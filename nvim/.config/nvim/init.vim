" ======================================== 
" Author: fagci
" CreationDate: 2021-07-04
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

" Backup, history, undoo
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
set stl+=%=%l:%c/%L\ %y

set shortmess+=c

" Install VIM-Plug if not
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'
" Plug 'SirVer/ultisnips'

" Utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vimwiki/vimwiki'
Plug 'vifm/vifm.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-dadbod'

" UI
Plug 'lifepillar/vim-gruvbox8'



" TEST ZONE

Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/vim-vsnip-integ'


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

nnoremap <Leader>M :GitMessenger<CR>

" ==============================
" EXPERIMENTS WITH LSP BELOW
" ==============================

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
end

--Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local general_on_attach = function(client, bufnr)
  if client.resolved_capabilities.completion then
    require "lsp_signature".on_attach()
  end
end

-- Setup basic lsp servers
for _, server in pairs({"pyright", "intelephense", "html", "cssls"}) do
  nvim_lsp[server].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        prefix = "//",
        spacing = 2,
--        severity_limit = "Warning",
    },
    underline = true,
    signs = true,
    update_in_insert = false,
  }
)

EOF


set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 2
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true
" let g:compe.source.emoji = v:true


inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vca <cmd>lua vim.lsp.buf.code_action()<CR>


colorscheme gruvbox8
hi NonText guifg=bg
highlight SignColumn guibg=GruvboxBg0
" highlight link NormalFloat GruvboxFg0

" Errors in Red
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
" Warnings in Yellow
hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
" Info and Hints in White
hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White

" Underline the offending code
hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline

hi LspDiagnosticsError guifg=Red ctermfg=Red cterm=underline gui=underline
hi LspDiagnosticsWarning guifg=Yellow ctermfg=Yellow cterm=underline gui=underline
hi LspDiagnosticsInformation guifg=Green ctermfg=Green cterm=underline gui=underline
hi LspDiagnosticsHint guifg=Cyan ctermfg=Cyan cterm=underline gui=underline
