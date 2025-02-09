return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'jose-elias-alvarez/null-ls.nvim',
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
            },
            'williamboman/mason-lspconfig.nvim',
            'ray-x/lsp_signature.nvim',
        },
        config = function()
            local lsp_signature = require 'lsp_signature'
            local lspconfig = require 'lspconfig'

            local defaults = {
                on_attach = function(client, bufnr)
                    lsp_signature.on_attach(client, bufnr)
                end,
                capabilities = require('cmp_nvim_lsp').default_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                ),
            }

            local configs = {
                -- bashls = {},
                eslint = {},
                gopls = {},
                clangd = {},
                html = {},
                intelephense = {},
                jsonls = {},
                pyright = {},
                sqlls = {},
                stylelint_lsp = {},
                ts_ls = {},
                vuels = {},
                yamlls = {},
                cssls = {},
                solargraph = {},
                -- lua_ls = {},
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = false
            })

            lsp_signature.setup {
                bind = true,
                handler_opts = { border = 'none' }
            }

            for server, config in pairs(configs) do
                lspconfig[server].setup(vim.tbl_deep_extend('force', defaults, config))
            end
        end
    },
}
