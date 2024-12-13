return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = function()
            require('plugins.config.nvim-cmp')
            require('plugins.config.snippets')
        end,
        dependencies = {
            'onsails/lspkind-nvim',
            'honza/vim-snippets',
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
    },
}
