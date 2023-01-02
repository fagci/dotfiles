local lsp_signature = require 'lsp_signature'
local lspconfig = require 'lspconfig'

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
    sumneko_lua = {},
}

require("fidget").setup()
require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})

lsp_signature.setup {
    bind = true,
    handler_opts = { border = 'none' }
}

for server, config in pairs(configs) do
    lspconfig[server].setup(vim.tbl_deep_extend('force', defaults, config))
end
