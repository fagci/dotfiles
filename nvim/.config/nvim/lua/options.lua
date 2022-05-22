local opt = vim.opt
local g = vim.g

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

-- Speed
opt.lazyredraw = true
opt.confirm = true
opt.synmaxcol = 1000
opt.updatetime = 250
opt.ttimeoutlen = 0

g.loaded_python_provider = 0
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'

-- Backups
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vimundo"
opt.undofile = true

-- UI
opt.number = true
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.signcolumn = "number"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.listchars = 'tab:▸ ,space:.,trail:•'
opt.fillchars = { eob = ' ' }
opt.colorcolumn = '120'

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.formatoptions = 'croqn'
opt.foldlevelstart = 99
opt.completeopt = "menu,menuone,noselect"
opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]

-- Search
opt.smartcase = true
opt.ignorecase = true

g.matchup_matchparen_offscreen = { method = 'popup' }
