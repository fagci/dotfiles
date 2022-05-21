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

return M
