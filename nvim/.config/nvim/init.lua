require 'disable_builtins'
require 'options'
require 'commands'
require 'mappings'

require 'init_packer'

require 'plugins'

vim.cmd("colorscheme duskfox")

-- FIXME:
--
-- PHP: sometimes cursor not indents on <CR>
-- HTML: shows closing tag when already entered
--
-- TODO:
--
-- cmp: better navigation pgup/pgdn
-- Regexp highlight
--
