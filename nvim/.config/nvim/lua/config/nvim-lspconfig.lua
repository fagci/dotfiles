local lsp = require 'lspconfig'
local lspinstall = require 'lspinstall'
local lsp_signature = require 'lsp_signature'


local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
    python = "flake8",
    php = {"phpcs", "psalm"},
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".eslintrc.js", "package.json"},
        debouce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    },
    flake8 = {
        command = "flake8",
        sourceName = "flake8",
        args = {"--format", "%(row)d:%(col)d:%(code)s: %(text)s", "%file"},
        formatPattern = {
            "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
            {
                line = 1,
                column = 2,
                message = {"[", 3, "] ", 5},
                security = 4
            }
        },
        securities = {
            E = "error",
            W = "warning",
            F = "info",
            B = "hint",
        },
    },
    phpcs = {
        command = "vendor/bin/phpcs",
        sourceName = "phpcs",
        debounce = 300,
        rootPatterns = {"composer.lock", "vendor", ".git"},
        args = {"--report=emacs", "-s", "-"},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = "phpcs",
        formatLines = 1,
        formatPattern = {
            "^.*:(\\d+):(\\d+):\\s+(.*)\\s+-\\s+(.*)(\\r|\\n)*$",
            {
                line = 1,
                column = 2,
                message = 4,
                security = 3
            }
        },
        securities = {
            error = "error",
            warning = "warning",
        },
        requiredFiles = {"vendor/bin/phpcs"}
    },
    psalm = {
        command = "vendor/bin/psalm",
        sourceName = "psalm",
        debounce = 100,
        rootPatterns = {"composer.lock", "vendor", ".git"},
        args = {"--output-format=emacs", "--no-progress"},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = "psalm",
        formatLines = 1,
        formatPattern = {
            "^[^ =]+ =(\\d+) =(\\d+) =(.*)\\s-\\s(.*)(\\r|\\n)*$",
            {
                line = 1,
                column = 2,
                message = 4,
                security = 3
            }
        },
        securities = {
            error = "error",
            warning = "warning"
        },
        requiredFiles = {"vendor/bin/psalm"}
    }
}



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
    lsp.diagnosticls.setup {
        on_attach = on_attach,
        filetypes = vim.tbl_keys(filetypes),
        init_options = {
            filetypes = filetypes,
            linters = linters,
        },
    }
end

local function post_install_hook()
    setup_servers()
    vim.cmd('bufdo e')
end


-- Automatically reload after :LspInstall <server>
lspinstall.post_install_hook = post_install_hook
setup_servers()
