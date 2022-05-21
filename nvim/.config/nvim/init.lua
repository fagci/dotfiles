require 'disable_builtins'
require 'options'
require 'commands'

require 'init_packer'

require 'plugins'
require 'mappings'


vim.cmd "highlight clear"
if vim.fn.exists "syntax_on" then
  vim.cmd "syntax reset"
end
vim.cmd([[
syntax on
"colorscheme OceanicNext
colorscheme srcery
let &fcs='eob: '
]])

-- FIXME:
--
-- PHP: sometimes cursor not indents on <CR>
-- HTML: shows closing tag when already entered
--
-- TODO:
--
-- Regexp highlight
--
