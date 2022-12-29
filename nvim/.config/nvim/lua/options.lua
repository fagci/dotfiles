local opt = vim.opt
local g = vim.g

-- Speed
opt.lazyredraw = true
opt.confirm = true
opt.synmaxcol = 1000
opt.updatetime = 250
opt.ttimeoutlen = 0

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
opt.listchars = { nbsp = '␣', tab = '▸ ', trail = '•', space = '.' }
opt.fillchars = { eob = ' ', vert = ' ' }
opt.colorcolumn = '120'

-- Editing
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.formatoptions = 'croqn'
opt.foldlevelstart = 99
opt.completeopt = "menu,menuone,noselect"
opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
opt.whichwrap:append "<>[]hl"

opt.statusline = table.concat {
    "%r%{expand('%:p:h:t')}/%t%{(&mod?'*':'')} ",
    "%=",
    "%y %l/%L",
}

-- Search
opt.smartcase = true
opt.ignorecase = true

g.matchup_matchparen_offscreen = { method = 'popup' }
