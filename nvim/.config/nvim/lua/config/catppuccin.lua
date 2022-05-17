require("catppuccin").setup({
    colorscheme = "soft_manilo",
    styles = {
        comments = "NONE",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
    },
    integrations = {
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "NONE",
                hints = "NONE",
                warnings = "NONE",
                information = "NONE",
            },
        },
        lsp_trouble = true,
        vim_sneak = true,
    }
})

