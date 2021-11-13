local lsp = require 'lspconfig'
local lspinstall = require 'lspinstall'
local lsp_signature = require 'lsp_signature'

local function on_attach(client, bufnr)
    lsp_signature.on_attach({bind = true, handler_opts = {border = "none"}}, bufnr)
end

local function setup_servers()
    lspinstall.setup()
    local servers = lspinstall.installed_servers()
    for _, server in pairs(servers) do
        lsp[server].setup{
            on_attach = on_attach,
            flags = {debounce_text_changes = 150}
        }
    end
end

local function post_install_hook()
    setup_servers()
    vim.cmd('bufdo e')
end


-- Automatically reload after :LspInstall <server>
lspinstall.post_install_hook = post_install_hook
setup_servers()
