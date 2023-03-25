return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/neodev.nvim',
            'j-hui/fidget.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
            },
            'williamboman/mason-lspconfig.nvim',
            'ray-x/lsp_signature.nvim',
        },
        config = function()
            require('plugins.config.nvim-lspconfig')
        end
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins.config.null-ls')
        end
    },
}
