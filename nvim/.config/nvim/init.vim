" ========================================
" Author: fagci
" CreationDate: 2021-07-04
" ========================================

" Speedup
let g:loaded_2html_plugin      = 1
let g:loaded_gzip              = 1
let g:loaded_logiPat           = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_remote_plugins    = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_zipPlugin         = 1

set lazyredraw
set updatetime=300
set hidden confirm " this speeds up buffer switch x25 I think
set switchbuf=useopen
set ttimeoutlen=0  " remove delay on mode change
set synmaxcol=1000
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
set completeopt=menu,menuone,noinsert
set nrformats=alpha,hex,bin " <c-a> <c-x> inc dec

" Search
set ignorecase incsearch hlsearch smartcase
set inccommand=nosplit " live substitution
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ -HS\ --line-number
  set grepformat=%f:%l:%c:%m
endif

" Statusline
set stl=[%n]%{&paste?'\ PASTE':''}\
set stl+=%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%)
set stl+=%=%l:%c/%L\ %y

set shortmess+=c

" Install VIM-Plug if not
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki' " to keep completions work

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Syntax hl
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nelsyeung/twig.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-editors/vim-elixir'
Plug 'chr4/nginx.vim'

" Completion
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Editing
Plug 'b3nj5m1n/kommentary'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'hrsh7th/vim-vsnip'
Plug 'mattn/emmet-vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'ray-x/lsp_signature.nvim'

" Utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vifm/vifm.vim'
Plug 'editorconfig/editorconfig-vim'

" UI
Plug 'RRethy/nvim-base16'

" TEST ZONE
Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
Plug 'andymass/vim-matchup'

call plug#end()

" ========================================
" Functions
" ========================================

let rg_default = 'rg --max-filesize=512000 --column --line-number --no-heading --color=always --glob "!.git/*"'
let rg_match_opts = ' --fixed-strings --smart-case'
let rg_full_opts = rg_match_opts . ' --no-ignore'
let rg_git_opts = rg_match_opts . ' --glob "!*.min.*" --glob "!*.bundle.*" --glob "!*.map"'

command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \   rg_default . rg_full_opts . ' -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* GRG
            \ call fzf#vim#grep(
            \   rg_default . rg_git_opts . ' -- '.shellescape(<q-args>), 1,
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

" Buffers management
nnoremap <leader>q :bp<bar>bd#<cr>
nnoremap <leader>Q :bp!<bar>bd!#<cr>

" toggle colorcolumn with ,|
nnoremap <silent> <leader><bar> :execute "set colorcolumn="
            \ . (&colorcolumn == "" ? "80" : "")<CR>

" Vifm
map <Leader>vv :Vifm<CR>

" Vim-plug
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>

" Project navigation
nnoremap <tab> :GFiles --cache<cr>
nnoremap <Leader><tab> :Files<CR>
nnoremap <Leader>f :GRG<CR>
nnoremap <Leader>F :RG<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>b :Buffers<CR>

" GIT (figitive + git-messenger)
nnoremap <Leader>gc :Commits<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gl :Git pull<CR>
nnoremap <Leader>M :GitMessenger<CR>

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>. <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>= :Neoformat<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vca <cmd>lua vim.lsp.buf.code_action()<CR>

" ==============================
" AUTOCOMMANDS
" ==============================

silent !stty -ixon

augroup Ixon
    autocmd! VimLeave * silent !stty ixon
augroup END

augroup GoToLastPosition
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END

augroup LangTemp
    autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
augroup END

" ==============================
" Variables
" ==============================

let g:matchup_matchparen_offscreen = { 'method': 'popup' }
let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 0,
            \ 'text_objs': 0,
            \ 'table_format': 0,
            \ 'table_mappings': 0,
            \ 'lists': 0,
            \ 'links': 1,
            \ 'html': 0,
            \ 'mouse': 0,
            \ }

" ==============================
" LUA
" ==============================

lua << EOF
local nvim_lsp = require('lspconfig')

vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
-- vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>/", "<Plug>kommentary_visual_default", {})

require('nvim-autopairs').setup()


-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
},
completion = { completeopt = 'menu,menuone,noinsert' },
mapping = {
  ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
},
experimental = { ghost_text = false, custom_menu = true },
formatting = {
    format = lspkind.cmp_format({with_text=false, menu = ({
        buffer = "[B]",
        nvim_lsp = "[L]",
        vsnip = "[S]",
        calc = "[C]",
        path = "[P]",
        neorg = "[N]",
        cmp_tabnine = "[T]",
    }),
    }),
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'calc' },
  { name = 'vsnip' },
}, {
  { name = 'buffer' },
})
})

cmp.setup.cmdline('/', {sources = {{ name = 'buffer' }}})
cmp.setup.cmdline(':', {sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})})

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
        on_attach = function(client, bufnr)
            require "lsp_signature".on_attach()
        end,
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

EOF

colorscheme base16-gruvbox-dark-hard
