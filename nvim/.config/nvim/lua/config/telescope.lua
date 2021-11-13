local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
    defaults = {
        layout_strategy = 'flex',
        scroll_strategy = 'cycle',
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
    pickers = {
        buffers = {
            sort_lastused = true,
            previewer = false,
            mappings = {i = {['<c-d>'] = 'delete_buffer'}, n = {['<c-d>'] = require('telescope.actions').delete_buffer}}
        },
    },
}

-- Extensions
telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
