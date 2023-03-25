return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require 'plugins.config.treesitter'
            require("treesitter-context").setup()
            require('plugins.config.nvim-autopairs')
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
            'windwp/nvim-autopairs',
            'windwp/nvim-ts-autotag',
        },
    },
}
