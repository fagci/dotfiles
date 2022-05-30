local api = vim.api
local function au(event, name, fn)
    api.nvim_create_autocmd({ event }, {
      group = api.nvim_create_augroup(name, { clear = true }),
      callback = fn,
    })
end

au('BufReadPost', 'LastPositionOnDocument', function()
    local line_data = api.nvim_buf_get_mark(0, '\"')
    local line = line_data[1]
    local last_line = api.nvim_buf_line_count(0)

    if line > 0 and line <= last_line then
      api.nvim_win_set_cursor(0, line_data)
    end
end)

au("TextYankPost", "HighlightOnYank", function ()
    vim.highlight.on_yank()
end)

-- Enable folds (zc and zo) on functions and classes but not by default
vim.cmd([[
  set nofoldenable
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])
