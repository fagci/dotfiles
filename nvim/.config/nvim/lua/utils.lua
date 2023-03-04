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

-- Valid mapping formats:
--
--local mapping = {
--  [{ 'n', 'x', 'i', 't' }] = {
--    { lhs, rhs, opts },
--  },
--}
--
-- OR
--
--local mapping = {
--  ['<C-a>'] = rhs,
--  qw = rhs,
--}
M.set_maps = function(mapping, arg1, arg2)
  local modes
  local options

  if arg1 and (arg1[1] or type(arg1) == 'string') then
    modes = arg1
    options = arg2
  else
    modes = arg2
    options = arg1
  end

  for key, value in pairs(mapping) do
    if type(value) == "table" then
      local mode = key
      local tbl = value

      for _, v in pairs(tbl) do
        local lhs = v[1]
        local rhs = v[2]

        local opts = options or {}
        if v[3] then
          opts = vim.tbl_deep_extend('keep', v[3], opts)
        end

        vim.keymap.set(mode, lhs, rhs, opts)
      end
    else
      local mode = modes or { 'n', 'x' }
      local lhs = key
      local rhs = value

      vim.keymap.set(mode, lhs, rhs, options)
    end
  end
end

return M
