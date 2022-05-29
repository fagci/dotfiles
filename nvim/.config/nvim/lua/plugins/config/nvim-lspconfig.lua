local lsp_installer = require 'nvim-lsp-installer'
local lsp_signature = require 'lsp_signature'
local lspconfig = require 'lspconfig'

lsp_signature.setup {
    bind = true,
    handler_opts = { border = 'none' }
}

local defaults = {
    on_attach = lsp_signature.on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
}

local configs = {
    eslint = {},
    gopls = {},
    jsonls = {},
    pyright = {},
    sqlls = {},
    stylelint_lsp = {},
    tsserver = {},
    vuels = {},
    yamlls = {},

    -- Trying to support things for inline css, emmet
    intelephense = {
        filetypes = { 'php', 'phtml' }
    },
    html = {
        filetypes = { 'html', 'phtml' }
    },
    emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'phtml' },
    },
    cssls = {
        filetypes = { 'css', 'scss', 'less', 'phtml' }
    },

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

lsp_installer.setup { automatic_installation = true }

for server, config in pairs(configs) do
    lspconfig[server].setup(vim.tbl_deep_extend('force', defaults, config))
end
