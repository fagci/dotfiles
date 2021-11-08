local map = vim.api.nvim_set_keymap

vim.g.mapleader =','

local N = { noremap = true }
local NS = { noremap = true, silent = true }


map('n', '<leader>ev', ':e ~/.config/nvim/lua/init.lua<CR>', N)
map('n', '<leader>sv', ':so ~/.config/nvim/init.lua<CR>', N)
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
map('n', '<tab>', ':Telescope git_files<cr>', N)
map('n', '<Leader><tab>', ':Telescope find_files hidden=true<CR>', N)
map('n', '<Leader>f', ':GRG<CR>', N)
map('n', '<Leader>F', ':Telescope live_grep<CR>', N)
map('n', '<Leader>h', ':Telescope history<CR>', N)
map('n', '<Leader>b', ':Telescope buffers<CR>', N)

map("n", "<leader>gc", ":Telescope git_commits<CR>", {})
map("n", "<leader>o", ":Telescope oldfiles<CR>", {})


-- GIT (figitive + git-messenger)
map('n', '<Leader>gc', ':Commits<CR>', N)
map('n', '<Leader>gp', ':Git push<CR>', N)
map('n', '<Leader>gl', ':Git pull<CR>', N)
map('n', '<Leader>M', ':GitMessenger<CR>', N)

-- LSP
map('n', '<silent>', 'gd <cmd>lua vim.lsp.buf.definition()<CR>', N)
map('n', '<silent>', 'gr <cmd>lua vim.lsp.buf.references()<CR>', N)
map('n', '<silent>', 'gi <cmd>lua vim.lsp.buf.implementation()<CR>', N)
map('n', '<leader>.', '<cmd>lua vim.lsp.buf.formatting()<CR>', N)
map('n', '<leader>=', ':Neoformat<CR>', N)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', N)
map('n', '<silent>', 'K <cmd>lua vim.lsp.buf.hover()<CR>', N)
map('n', '<silent>', '<C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>', N)
map('n', '<leader>vn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', N)
map('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', N)

map("n", "<leader>/", "<Plug>kommentary_line_default", {})
-- map("n", "<leader>/", "<Plug>kommentary_motion_default", {})
map("x", "<leader>/", "<Plug>kommentary_visual_default", {})
