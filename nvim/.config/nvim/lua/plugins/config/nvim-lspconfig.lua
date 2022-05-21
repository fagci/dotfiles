local lsp_installer = require 'nvim-lsp-installer'
local lsp_signature = require 'lsp_signature'

local function on_attach(_, bufnr)
    lsp_signature.on_attach({
        bind = true,
        handler_opts = { border = "none" }
    }, bufnr)
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 }
    }
    server:setup(opts)
end)
