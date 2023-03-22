return {
    'max-perf',
    winopts = {
        preview = {
            border = 'noborder',
            vertical   = 'up:45%',    -- up|down:size
            horizontal = 'right:50%', -- right|left:size
        },
    },
    fzf_opts = {
        ['--layout'] = false,
    },
    files = {
        prompt  = 'Files> ',
        fd_opts = "--color=never --type f -IL --exclude .git",
    },
    grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings --max-columns=512" ..
            [[ --glob "!*.{min.js,min.css,jpg,jpeg,gif,png,zip,lock}" ]] ..
            [[ --glob "!{.git,node_modules,log,tmp,cache}/*" ]],
        actions = { ["ctrl-g"] = false },
    },
}
