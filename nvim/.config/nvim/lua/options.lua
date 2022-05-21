local opt = vim.opt
local g = vim.g

-- Speed
opt.lazyredraw = true
opt.confirm = true -- TODO: check default
opt.synmaxcol = 1000
opt.switchbuf = 'useopen' -- ?
opt.updatetime = 150
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
--[[ opt.statusline = 
    "%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%) " ..
    "%="..
    "%l:%c/%L %y" ]]

-- Editing
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.smartindent = true
opt.formatoptions = 'croqn'
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.foldlevelstart = 99
opt.completeopt = "menuone,noinsert,noselect"
opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]

-- Search
opt.smartcase = true
opt.ignorecase = true

g.matchup_matchparen_offscreen = { method = 'popup' }
