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

vim.cmd [[
augroup FiletypeMakeprg
    autocmd!
    autocmd Filetype ruby setlocal makeprg=ruby\ %
    autocmd Filetype php setlocal makeprg=php\ %
    autocmd Filetype python setlocal makeprg=python\ %
    autocmd Filetype go setlocal makeprg=go\ run\ %
    autocmd Filetype sh setlocal makeprg=%:p
    autocmd Filetype zsh setlocal makeprg=zsh\ %
    autocmd Filetype javascript setlocal makeprg=node\ %
    autocmd Filetype lua setlocal makeprg=lua\ %
    autocmd Filetype perl setlocal makeprg=perl\ %
    autocmd Filetype java setlocal makeprg=javac\ -g:none\ %\ &&\ java\ %:r
augroup END
augroup HurlFT
    autocmd! BufRead,BufNewFile *.hurl set filetype=hurl
augroup END
]]
