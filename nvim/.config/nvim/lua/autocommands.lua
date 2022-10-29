au('LastPositionOnDocument', 'BufReadPost', function()
    local line_data = vim.api.nvim_buf_get_mark(0, '"')
    local line = line_data[1]
    local last_line = vim.api.nvim_buf_line_count(0)

    if line > 0 and line <= last_line then
        vim.api.nvim_win_set_cursor(0, line_data)
    end
end)

au("HighlightOnYank", "TextYankPost", function()
    vim.highlight.on_yank()
end)

