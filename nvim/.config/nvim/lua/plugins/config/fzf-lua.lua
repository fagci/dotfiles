local disable_icons = {
    git_icons   = false,
    file_icons  = false,
    color_icons = false,
}

require 'fzf-lua'.setup {
    winopts = {
        height  = 0.85, -- window height
        width   = 0.80, -- window width
        row     = 0.35, -- window row position (0=top, 1=bottom)
        col     = 0.50, -- window col position (0=left, 1=right)
        hl      = {
            normal      = 'Normal', -- window normal color (fg+bg)
            border      = 'IndentBlanklineChar', -- border color (try 'FloatBorder')
            -- Only valid with the builtin previewer:
            cursor      = 'CursorColumn', -- cursor highlight (grep/LSP matches)
            cursorline  = 'CursorLine', -- cursor line
            search      = 'Search', -- search matches (ctags)
            title       = 'Normal', -- preview border title (file/buffer)
            scrollbar_f = 'PmenuThumb', -- scrollbar "full" section highlight
            scrollbar_e = 'PmenuSbar', -- scrollbar "empty" section highlight
        },
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
        prompt = 'Files> ', -- this gone. fzf-lua bug? TODO: remove
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
