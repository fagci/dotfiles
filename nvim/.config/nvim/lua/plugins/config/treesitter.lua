local ts_configs = require 'nvim-treesitter.configs'
ts_configs.setup {
    ensure_installed = {
        'php', 'html', 'css', 'javascript', 'jsdoc', 'yaml',
        'go', 'python',
        'json', 'bash',
        'lua', 'perl'
    },
    sync_installed = true,
    highlight = {
        enable = true,
        disable = { 'html' }, -- fix for twig
        -- additional_vim_regex_highlighting = { 'php' },
    },
    indent = {
        enable = true,
        disable = { 'php' },
    },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = ',r' } },
        highlight_definitions = { enable = true },
    },
    textobjects = {
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
