require('nvim-treesitter.configs').setup {
    autotag = { enable = true },
    ensure_installed = {
        'php', 'html', 'css', 'javascript', 'jsdoc', 'yaml',
        'go', 'python',
        'json', 'bash',
        'lua', 'perl', 'ruby'
    },
    sync_installed = true,
    highlight = {
        enable = true,
        disable = { 'html', 'eruby' }, -- fix for twig
        -- additional_vim_regex_highlighting = { 'php' },
    },
    indent = {
        enable = true,
        disable = { 'php' },
    },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = ',rr' } },
        highlight_definitions = { enable = true },
    },
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<A-RIGHT>"] = "@parameter.inner",
            },
            swap_previous = {
                ["<A-LEFT>"] = "@parameter.inner",
            },
        },
        select = {
            enable = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['aC'] = '@class.outer',
                ['iC'] = '@class.inner',
                ['ac'] = '@conditional.outer',
                ['ic'] = '@conditional.inner',
                ['ae'] = '@block.outer',
                ['ie'] = '@block.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['is'] = '@statement.inner',
                ['as'] = '@statement.outer',
                ['ad'] = '@comment.outer',
                ['am'] = '@call.outer',
                ['im'] = '@call.inner',
            },
        },
    },
}
