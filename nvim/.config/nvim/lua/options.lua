local opt = vim.opt
local wo = vim.wo
local bo = vim.bo

-- Speed
opt.lazyredraw = true
opt.hidden = true
opt.confirm = true
opt.synmaxcol = 1000
opt.switchbuf = 'useopen'
opt.updatetime = 150
opt.timeoutlen = 1000

-- Backups
opt.backup = false
opt.writebackup = false
bo.swapfile = false
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

-- Editing
wo.wrap = false
opt.clipboard = 'unnamedplus'
bo.autoindent = true
bo.expandtab = true
bo.shiftwidth = 4
bo.smartindent = true
bo.softtabstop = 4
bo.tabstop = 4
opt.completeopt = "menuone,noinsert,noselect"

-- Search
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = 'nosplit'

opt.shortmess:append "c"

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

