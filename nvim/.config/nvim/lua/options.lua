local opt = vim.opt
local wo = vim.wo
local g = vim.g

-- Speed
opt.lazyredraw = true
opt.hidden = true
opt.confirm = true
opt.synmaxcol = 1000
opt.switchbuf = 'useopen'
opt.updatetime = 150
opt.timeoutlen = 1000
opt.ttimeoutlen = 0

g.loaded_python_provider = 0
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'
g.node_host_prog = '/usr/bin/neovim-node-host'

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
wo.signcolumn = "number"
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.listchars='tab:▸ ,space:.,trail:•'
wo.colorcolumn = '80,120'
wo.statusline = "[%n]%{&paste?' PASTE':''} "
wo.statusline = wo.statusline .. "%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%) "
wo.statusline = wo.statusline .. "%=%l:%c/%L %y"

-- Editing
wo.wrap = false
opt.clipboard = 'unnamedplus'
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
-- opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4
opt.completeopt = "menuone,noinsert,noselect"
opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]


-- Search
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = 'nosplit'

opt.shortmess:append "c"

opt.formatoptions = 'croqn'
vim.cmd('filetype plugin indent on')
vim.g.matchup_matchparen_offscreen = {method = 'popup'}
