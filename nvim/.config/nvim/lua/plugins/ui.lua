return {
    {
        'NvChad/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = require('plugins.config.colorizer')
    },
    {
        'stevearc/aerial.nvim',
        config = {},
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        cmd = { 'AerialToggle' }
    },
    {
        'folke/which-key.nvim',
        config = {}
    },
}
