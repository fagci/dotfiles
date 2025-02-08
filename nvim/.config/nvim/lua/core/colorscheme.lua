vim.cmd.colorscheme('retrobox')

local function hi(group, colors)
    vim.api.nvim_set_hl(0, group, colors)
end

--[[ hi('Normal', { ctermbg = nil })
hi('Comment', { bold = false, ctermfg = 243 })
hi('String', { ctermfg = 107 })
hi('Keyword', { ctermfg = 172 })
hi('NormalFloat', { ctermbg = 232 })
hi('PMenu', { ctermbg = 232 })
hi('PMenuSel', { ctermbg = 59 }) ]]

