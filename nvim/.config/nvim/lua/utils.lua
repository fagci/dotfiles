local ft = require('Comment.ft')
local c_api = require('Comment.api')

local M = {}

M.toggle_visual_comment = function()
    -- if lang has single line comment only, toggle line by line
    if #ft.lang(vim.bo.filetype) == 1 then
        c_api.toggle_linewise_op(vim.fn.visualmode())
    else
        c_api.toggle_blockwise_op(vim.fn.visualmode())
    end
end

M.grep_noignore = function()
    require("fzf-lua").live_grep({
        rg_opts = "-uu --follow --column --line-number --no-heading --color=always --smart-case --fixed-strings --max-columns=512" ..
            [[ --glob "!*.min.*" --glob "!*.bundle.*" --glob "!*.map" --glob "!*.git"]]
    })
end

return M
