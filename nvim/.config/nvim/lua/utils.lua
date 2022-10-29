local ft = require('Comment.ft')
local c_api = require('Comment.api')

local M = {}

M.toggle_visual_comment = function()
    -- if lang has single line comment only, toggle line by line
    if #ft.get(vim.bo.filetype) == 1 then
        c_api.toggle.linewise(vim.fn.visualmode())
    else
        c_api.toggle.blockwise(vim.fn.visualmode())
    end
end

M.grep_noignore = function()
    require("fzf-lua").grep_project({
        rg_opts = "-u --follow --column --line-number --no-heading --color=always --smart-case --fixed-strings --max-columns=512" ..
            [[ --glob "!*.{min.js,min.css,jpg,jpeg,gif,png,zip}" ]] ..
            [[ --glob "!{.git,node_modules,log,tmp,cache}/*" ]]
    })
end

M.lsp_format_async = function()
    if type(vim.lsp.buf.format) == "function" then
        vim.lsp.buf.format({ async = true })
    elseif type(vim.lsp.buf.formatting) == "function" then
        vim.lsp.buf.formatting()
    end
end

return M
