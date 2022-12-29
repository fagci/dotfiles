local disable_icons = {
    git_icons   = false,
    file_icons  = false,
    color_icons = false,
}

return {
    winopts = {
        preview = {
            vertical   = 'up:45%', -- up|down:size
            horizontal = 'right:50%', -- right|left:size
        },
    },
    fzf_opts = {
        ['--layout'] = false,
    },
    fzf_colors = {
        ["bg+"]    = { "bg", "CursorColumn" },
        ["fg+"]    = { "fg", "BufferLineIndicatorSelected" },
        ["gutter"] = { "bg", "Normal" },
    },
    files = vim.tbl_extend("force", disable_icons, {
        prompt  = 'Files> ',
        fd_opts = "--color=never --type f -IL --exclude .git",
    }),
    buffers = disable_icons,
    tags = disable_icons,
    btags = disable_icons,
    lsp = disable_icons,
    git = {
        files = disable_icons,
        status = disable_icons,
    },
    grep = vim.tbl_extend("force", {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings --max-columns=512" ..
            [[ --glob "!*.{min.js,min.css,jpg,jpeg,gif,png,zip}" ]] ..
            [[ --glob "!{.git,node_modules,log,tmp,cache}/*" ]],
        actions = { ["ctrl-g"] = false },
    }, disable_icons),
}
