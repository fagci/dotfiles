-- Creates simple autocmd
_G.au = function(group_name, event, fn)
    vim.api.nvim_create_autocmd({ event }, {
        group = vim.api.nvim_create_augroup(group_name, { clear = true }),
        callback = fn,
    })
end

-- Inspect vatiable
_G.P = function(v)
    print(vim.inspect(v))
    return v
end

