local set_maps = function(mapping, arg1, arg2)
    local modes
    local options

    if arg1 and (arg1[1] or type(arg1) == 'string') then
        modes = arg1
        options = arg2
    else
        modes = arg2
        options = arg1
    end

    for key, value in pairs(mapping) do
        if type(value) == "table" then
            local mode = key
            local tbl = value

            for _, v in pairs(tbl) do
                local lhs = v[1]
                local rhs = v[2]

                local opts = options or {}
                if v[3] then
                    opts = vim.tbl_deep_extend('keep', v[3], opts)
                end

                vim.keymap.set(mode, lhs, rhs, opts)
            end
        else
            local mode = modes or { 'n', 'x' }
            local lhs = key
            local rhs = value

            vim.keymap.set(mode, lhs, rhs, options)
        end
    end
end


set_maps({
    [{ 'n', 'x' }] = {
        { '<leader>ev',       ':FzfLua files cwd=~/.config/nvim/<CR>' },
        { '<leader>em',       ':e ~/.config/nvim/lua/mappings.lua<CR>' },
        { '<leader>ep',       ':e ~/.config/nvim/lua/plugins/base.lua<CR>' },
        { '<leader>eo',       ':e ~/.config/nvim/lua/options.lua<CR>' },

        { '<leader>l',        ':set list!<CR>' },
        { '<leader>n',        ':set number!<CR>' },
        { '<Leader>s',        ':set spell!<CR>' },
        { '<Leader><leader>', ':noh<CR>' },
        { '<leader>x',        ':make<CR>' },

        { '<',                '<<' },
        { '>',                '>>' },

        -- Navigate buffers
        { 'bn',               ':bn<CR>' },
        { 'bp',               ':bp<CR>' },
        { 'b#',               ':b#<CR>' },

        -- Navigate windows
        { '<C-LEFT>',         '<C-w>h' },
        { '<C-DOWN>',         '<C-w>j' },
        { '<C-UP>',           '<C-w>k' },
        { '<C-RIGHT>',        '<C-w>l' },

        -- Scroll buffer contents
        { '<C-UP>',           '<C-Y>' },
        { '<C-DOWN>',         '<C-E>' },

        { "<C-e>",
            function()
                local result = vim.treesitter.get_captures_at_cursor(0)
                print(vim.inspect(result))
            end },

        -- Buffers management
        { '<leader>q',     ':bp<bar>bd#<cr>' },
        { '<leader>Q',     ':bp!<bar>bd!#<cr>' },

        -- Vifm
        { '<Leader>vv',    ':Vifm<CR>' },

        -- lazy
        { '<leader>pi',    ':Lazy install<CR>' },
        { '<leader>pu',    ':Lazy update<CR>' },
        { '<leader>pc',    ':Lazy clean<CR>' },
        { '<leader>ps',    ':Lazy sync<CR>' },

        -- Project navigation
        { '<tab>',         ':FzfLua git_files<cr>' },
        { '<Leader><tab>', ':FzfLua files<CR>' },
        { '<Leader>f',     ':FzfLua grep_project<CR>' },
        { '<Leader>F',     ':lua require("utils").grep_noignore()<CR>' },
        { '<Leader>h',     ':FzfLua loclist<CR>' },
        { '<Leader>j',     ':FzfLua jumps<CR>' },
        { '<Leader>b',     ':FzfLua buffers<CR>' },
        { '<Leader>"',     ':FzfLua registers<CR>' },
        { '<Leader>R',     ':FzfLua lsp_live_workspace_symbols<CR>' },
        { '<Leader>t',     ':Neotree reveal toggle<CR>' },
        { '<Leader>o',     ':AerialToggle<CR>' },
        { '<Leader>u',     ':UndotreeToggle<CR>' },

        -- LSP
        { 'gd',            '<cmd>lua vim.lsp.buf.definition()<CR>' },
        { 'gr',            '<cmd>lua vim.lsp.buf.references()<CR>' },
        --         {'gd', ':Trouble lsp_definitions<CR>'},
        --        {'gr', ':Trouble lsp_references<CR>'},
        { 'ge',            ':Trouble lsp_document_diagnostics<CR>' },

        { 'gi',            '<cmd>lua vim.lsp.buf.implementation()<CR>' },
        { '<leader>.',     '<cmd>lua vim.lsp.buf.format({ async = true })<CR>' },
        { '<leader>=',     ':Neoformat<CR>' },
        { 'K',             '<cmd>lua vim.lsp.buf.hover()<CR>' },
        { '<C-k>',         '<cmd>lua vim.lsp.buf.signature_help()<CR>' },
        { '<leader>vn',    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>' },
        { '<leader>a',     '<cmd>lua vim.lsp.buf.code_action()<CR>' },

        -- Extract block doesn't need visual mode
        { "<leader>rb",    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]] },
        { "<leader>rbf",   [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]] },

        -- Inline variable can also pick up the identifier currently under the cursor without visual mode
        { "<leader>ri",    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]] },

        -- Grepper
        { 'gs',            '<Plug>(GrepperOperator)' },
    },
    [{ 'v', 'x' }] = {
        { '<',          '<gv' },
        { '>',          '>gv' },

        -- Refactor
        -- Remaps for the refactoring operations currently offered by the plugin
        { "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]] },
        { "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]] },
        { "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]] },
        { "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]] },
    },
    -- Resize windows
    [{ 'n', 'i', 'v', 'x' }] = {
        { '<C-S-Left>',  ':vertical resize -1<CR>' },
        { '<C-S-Right>', ':vertical resize +1<CR>' },
        { '<C-S-Up>',    ':resize +1<CR>' },
        { '<C-S-Down>',  ':resize -1<CR>' },
    },
    -- EasyAlign
    [{ 'n', 'v' }] = {
        { "ga", "<Plug>(EasyAlign)" },
    },

    -- Move lines
    ['n'] = {
        { '<A-DOWN>', ':m .+1<CR>==' },
        { '<A-UP>',   ':m .-2<CR>==' },
    },
    ['i'] = {
        { '<A-DOWN>', '<Esc>:m .+1<CR>==gi' },
        { '<A-UP>',   '<Esc>:m .-2<CR>==gi' },
    },
    ['v'] = {
        { '<A-DOWN>', ':m \'>+1<CR>gv=gv' },
        { '<A-UP>',   ':m \'<-2<CR>gv=gv' },
    },
})
