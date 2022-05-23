local null_ls = require('null-ls')
local builtins = null_ls.builtins
null_ls.setup({
    sources = {
        builtins.diagnostics.shellcheck,
        builtins.diagnostics.zsh,
    },
})
