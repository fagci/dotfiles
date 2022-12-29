local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--fixed-strings',
            '--glob', '!*.{min.js,min.css,jpg,jpeg,gif,png,zip}',
            '--glob', '!{.git,node_modules,log,tmp,cache}/*'
        },
        mappings = {
            i = {
                ['<esc>'] = actions.close
            },
        },
    },
    pickers = {
        find_files = {
            find_command = {
                'rg',
                '--files', '--hidden',
                '--glob', '!**/.git/*',
                '--glob', '!*.{min.js,min.css,jpg,jpeg,gif,png,zip}',
            },
        },
    },
}
