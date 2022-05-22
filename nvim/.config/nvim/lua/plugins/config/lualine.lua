require('lualine').setup {
    options = {
        theme = 'OceanicNext',
        icons_enabled = false,
        component_separators = {
            left = "|",
            right = "|"
        },
        section_separators = {
            left = "",
            right = ""
        }
    },
    sections = {
        lualine_a = {},
        lualine_b = {
            {
                "diagnostics",
                symbols = { error = "E", warn = "W", hint = "H", info = "I" },
            },
            {
                "filename",
                symbols = { modified = "*", readonly = "(ro)" },
            },
        },
        lualine_c = {
            { 'lsp_progress', spinner_symbols = { '|', '/', '-', '\\' } }
        },
        lualine_x = { 'filetype' },
        lualine_y = { '%l/%L' },
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
