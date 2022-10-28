local lsp_installer = require 'nvim-lsp-installer'
local lsp_signature = require 'lsp_signature'
local lspconfig = require 'lspconfig'

lsp_signature.setup {
    bind = true,
    handler_opts = { border = 'none' }
}

local defaults = {
    on_attach = lsp_signature.on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
}

local configs = {
    eslint = {},
    gopls = {},
    html = {},
    intelephense = {},
    jsonls = {},
    pyright = {},
    sqlls = {},
    stylelint_lsp = {},
    tsserver = {},
    vuels = {},
    yamlls = {},
    cssls = {},
    solargraph = {},

    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.stdpath('config') .. '/lua'] = true,
                    }
                }
            }
        }
    },
}

lsp_installer.setup {
    automatic_installation = true,
}

for server, config in pairs(configs) do
    lspconfig[server].setup(vim.tbl_deep_extend('force', defaults, config))
end
