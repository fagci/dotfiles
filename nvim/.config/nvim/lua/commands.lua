local api = vim.api
function au(event, name, fn)
    api.nvim_create_autocmd({ event }, {
      group = api.nvim_create_augroup(name, { clear = true }),
      callback = fn,
    })
end
-- Last position on Document
au('BufReadPost', 'LastPosition', function()
    local line_data = api.nvim_buf_get_mark(0, '\"')
    local line = line_data[1]
    local last_line = api.nvim_buf_line_count(0)

    if line > 0 and line <= last_line then
      api.nvim_win_set_cursor(0, line_data)
    end
end)

vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

au! TextYankPost * silent! lua vim.highlight.on_yank()
]])
