return {
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("fzf-lua").setup({
                'max-perf',
                winopts = {
                    backdrop = 100,
                    border   = "single",
                    -- fullscreen = true,
                    preview  = {
                        delay      = 1000,
                        border     = 'noborder',
                        vertical   = 'up:45%', -- up|down:size
                        horizontal = 'right:50%', -- right|left:size
                    },
                },
                previewers = {
                    builtin = {
                        syntax = false,
                    },
                    bat = {
                        args = "--color=never --style=numbers",
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
                    rg_opts =
                        "--column --line-number --no-heading --color=always --smart-case --fixed-strings --max-columns=512" ..
                        [[ --glob "!*.{min.js,min.css,jpg,jpeg,gif,png,zip,lock}" ]] ..
                        [[ --glob "!{.git,node_modules,log,tmp,cache}/*" ]],
                    actions = { ["ctrl-g"] = false },
                },
            })
        end
    }
}
