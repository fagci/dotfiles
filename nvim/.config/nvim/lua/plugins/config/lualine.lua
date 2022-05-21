local gps = require("nvim-gps")
require('lualine').setup {
    options = {
        theme = 'tokyonight',
    },
    sections = {
        lualine_a = { 'diagnostics' },
        lualine_b = { 'filename' },
        lualine_c = { { gps.get_location, cond = gps.is_available }, },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
