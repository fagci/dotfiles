local map = vim.api.nvim_set_keymap

local N = { noremap = true }
local NS = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', '<leader>ev', ':e ~/.config/nvim/init.lua<CR>', N)
map('n', '<leader>em', ':e ~/.config/nvim/lua/mappings.lua<CR>', N)
map('n', '<leader>ep', ':e ~/.config/nvim/lua/plugins.lua<CR>', N)
map('n', '<leader>eo', ':e ~/.config/nvim/lua/options.lua<CR>', N)

map('n', '<Leader>,', ':noh<CR>', N)
map('n', '<', '<<', {})
map('n', '>', '>>', {})
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})

map('', '<leader>l', ':set list!<CR>', {})

map('n', '<Leader>s', ':set spell!<cr>', N)

-- Navigate buffers
map('n', 'bn', ':bn<CR>', N)
map('n', 'bp', ':bp<CR>', N)
map('n', 'b#', ':b#<CR>', N)

-- Navigate windows
map('n', '<C-LEFT>', '<C-w>h', N)
map('n', '<C-DOWN>', '<C-w>j', N)
map('n', '<C-UP>', '<C-w>k', N)
map('n', '<C-RIGHT>', '<C-w>l', N)

-- Move lines
map('n', '<A-DOWN>', ':m .+1<CR>==', N)
map('n', '<A-UP>', ':m .-2<CR>==', N)
map('i', '<A-DOWN>', '<Esc>:m .+1<CR>==gi', N)
map('i', '<A-UP>', '<Esc>:m .-2<CR>==gi', N)
map('v', '<A-DOWN>', ':m \'>+1<CR>gv=gv', N)
map('v', '<A-UP>', ':m \'<-2<CR>gv=gv', N)
map('n', '<A-LEFT>', ':SidewaysLeft<CR>', N)
map('n', '<A-RIGHT>', ':SidewaysRight<CR>', N)
map('n', '<C-A-LEFT>', ':SidewaysLeft<CR>', N)
map('n', '<C-A-RIGHT>', ':SidewaysRight<CR>', N)

-- Resize windows
map('', '<C-S-Left>', ':vertical resize -1<CR>', NS)
map('', '<C-S-Right>', ':vertical resize +1<CR>', NS)
map('', '<C-S-Up>', ':resize +1<CR>', NS)
map('', '<C-S-Down>', ':resize -1<CR>', NS)

-- Buffers management
map('n', '<leader>q', ':bp<bar>bd#<cr>', N)
map('n', '<leader>Q', ':bp!<bar>bd!#<cr>', N)

-- Vifm
map('', '<Leader>vv', ':Vifm<CR>', {})

-- Vim-plug
map('n', '<leader>pi', ':PackerInstall<CR>', NS)
map('n', '<leader>pu', ':PackerUpdate<CR>', NS)
map('n', '<leader>pc', ':PackerClean<CR>', NS)
map('n', '<leader>pg', ':PackerUpgrade<CR>', NS)
map('n', '<leader>ps', ':PackerSync<CR>', NS)

-- Project navigation
map('n', '<tab>', ':GFiles<cr>', N)
map('n', '<Leader><tab>', ':Files<CR>', N)
map('n', '<Leader>f', ':GRG<CR>', N)
map('n', '<Leader>F', ':RG<CR>', N)
map('n', '<Leader>h', ':History<CR>', N)
map('n', '<Leader>b', ':Buffers<CR>', N)
map('n', '<Leader>t', ':NvimTreeToggle<CR>', N)
map('n', '<Leader>o', ':SymbolsOutline<CR>', N)

-- LSP
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', NS)
map('n', 'gd', ':Trouble lsp_definitions<CR>', NS)
-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', NS)
map('n', 'gr', ':Trouble lsp_references<CR>', NS)
map('n', 'ge', ':Trouble lsp_document_diagnostics<CR>', NS)

map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', NS)
map('n', '<leader>.', '<cmd>lua vim.lsp.buf.format{async=true}<CR>', N)
map('n', '<leader>=', ':Neoformat<CR>', N)
-- map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', N)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', NS)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', NS)
map('n', '<leader>vn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', N)
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', N)

-- Kommentary
map("n", "<leader>/", "<Plug>kommentary_line_default", {})
map("n", "gc", "<Plug>kommentary_motion_default", {})
map("x", "<leader>/", "<Plug>kommentary_visual_default", {})

-- Grepper
map('n', 'gs', '<Plug>(GrepperOperator)', {})
map('x', 'gs', '<Plug>(GrepperOperator)', {})
