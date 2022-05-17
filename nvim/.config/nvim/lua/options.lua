local opt = vim.opt
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
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.listchars = 'tab:▸ ,space:.,trail:•'
opt.colorcolumn = '120'
opt.statusline = 
    "%(%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')}%) " ..
    "%="..
    "%l:%c/%L %y"

-- Editing
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.foldlevelstart = 99
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

vim.cmd("filetype plugin indent on")

if vim.fn.executable('rg') then
    opt.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
    opt.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable('ag') then
    opt.grepprg = [[ag --nogroup --nocolor --vimgrep]]
end
g.matchup_matchparen_offscreen = { method = 'popup' }
