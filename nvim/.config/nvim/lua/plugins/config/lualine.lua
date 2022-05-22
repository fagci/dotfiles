require('lualine').setup {
    options = {
        theme = 'OceanicNext',
    },
    sections = {
        lualine_a = {},
        lualine_b = { 'diagnostics', 'filename' },
        lualine_c = { 'lsp_progress' },
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
