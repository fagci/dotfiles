local null_ls = require('null-ls')
local builtins = null_ls.builtins
return {
    sources = {
        builtins.diagnostics.shellcheck,
        builtins.diagnostics.zsh,
    },
}
