-- Creates simple autocmd
_G.au = function(group_name, event, fn, opts)
    local def_opts = {
        group = vim.api.nvim_create_augroup(group_name, { clear = true }),
        callback = fn,
    }
    vim.tbl_deep_extend('force', def_opts, opts or {})
    vim.api.nvim_create_autocmd({ event }, def_opts)
end

-- Inspect variable
_G.P = function(v)
    print(vim.inspect(v))
    return v
end

