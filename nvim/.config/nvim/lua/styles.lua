vim.g.sonokai_style = 'maia'

if string.find(tostring(vim.fn.getenv('PREFIX')), 'termux') then
    vim.g.sonokai_disable_italic_comment=1
    vim.g.sonokai_enable_italic = 0
end

vim.cmd([[
colorscheme sonokai
let &fcs='eob: '
]])

