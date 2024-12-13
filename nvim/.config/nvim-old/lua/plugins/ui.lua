return {
    {
        'NvChad/nvim-colorizer.lua',
        ft = { 'css', 'html' },
        opts = require('plugins.config.colorizer')
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        cmd = { 'AerialToggle' }
    },
}