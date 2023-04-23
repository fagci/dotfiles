return {
    { 'folke/lazy.nvim' },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            compile = true,
            colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            statementStyle = { bold = false },
        },
        init = function()
            vim.cmd.colorscheme "kanagawa"
        end
    },
    {
        "kyazdani42/nvim-web-devicons",
        opts = { color_icons = false },
        config = true,
    },
    { 'chr4/nginx.vim',     ft = 'nginx' },
    { 'nelsyeung/twig.vim', ft = 'twig' },
}
