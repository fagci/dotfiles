local map = vim.api.nvim_set_keymap

local N = { noremap = true }
local NS = { noremap = true, silent = true }

vim.g.mapleader = ','

map('n', '<leader>ev', ':FzfLua files cwd=~/.config/nvim/<CR>', N)
map('n', '<leader>em', ':e ~/.config/nvim/lua/mappings.lua<CR>', N)
map('n', '<leader>ep', ':e ~/.config/nvim/lua/plugins/plugins.lua<CR>', N)
map('n', '<leader>eo', ':e ~/.config/nvim/lua/options.lua<CR>', N)

map('n', '<Leader>,', ':noh<CR>', N)
map('n', '<', '<<', {})
map('n', '>', '>>', {})
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})

map('', '<leader>l', ':set list!<CR>', {})
map('', '<leader>n', ':set number!<CR>', {})

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

-- Scroll buffer contents
map('n', '<C-UP>', '<C-Y>', N)
map('n', '<C-DOWN>', '<C-E>', N)

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
map('n', '<tab>', ':FzfLua git_files<cr>', N)
map('n', '<Leader><tab>', ':FzfLua files<CR>', N)
map('n', '<Leader>f', ':FzfLua grep_project<CR>', N)
map('n', '<Leader>F', ':lua require("utils").grep_noignore()<CR>', N)
map('n', '<Leader>h', ':FzfLua loclist<CR>', N)
map('n', '<Leader>j', ':FzfLua jumps<CR>', N)
map('n', '<Leader>b', ':FzfLua buffers<CR>', N)
map('n', '<Leader>"', ':FzfLua registers<CR>', N)
map('n', '<Leader>t', ':NeoTreeShowToggle<CR>', N)
map('n', '<Leader>o', ':AerialToggle<CR>', N)

-- LSP
map('n', 'gd', ':Trouble lsp_definitions<CR>', NS)
map('n', 'gr', ':Trouble lsp_references<CR>', NS)
map('n', 'ge', ':Trouble lsp_document_diagnostics<CR>', NS)

map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', NS)
map('n', '<leader>.', '<cmd>lua require("utils").lsp_format_async()<CR>', N)
map('n', '<leader>=', ':Neoformat<CR>', N)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', NS)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', NS)
map('n', '<leader>vn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', N)
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', N)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", {})
map("x", "<leader>/", "<ESC><cmd>lua require('utils').toggle_visual_comment()<CR>", {})

-- Grepper
map('n', 'gs', '<Plug>(GrepperOperator)', {})
map('x', 'gs', '<Plug>(GrepperOperator)', {})

-- Dial (inc/dec, switch)
map("n", "<C-a>", require("dial.map").inc_normal(), N)
map("n", "<C-x>", require("dial.map").dec_normal(), N)
map("v", "<C-a>", require("dial.map").inc_visual(), N)
map("v", "<C-x>", require("dial.map").dec_visual(), N)
map("v", "g<C-a>", require("dial.map").inc_gvisual(), N)
map("v", "g<C-x>", require("dial.map").dec_gvisual(), N)

-- EasyAlign
map("n", "ga", "<Plug>(EasyAlign)", N)
map("v", "ga", "<Plug>(EasyAlign)", N)

map('n', '<leader>x', ':make<CR>', N)
