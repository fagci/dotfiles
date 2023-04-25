return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require 'plugins.config.treesitter'
            require('plugins.config.nvim-autopairs')
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-autopairs',
            'windwp/nvim-ts-autotag',
        },
    },
}
