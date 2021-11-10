require 'disable_builtins'
require 'options'
require 'commands'
require 'mappings'

require 'init_packer'

require 'plugins'
require 'styles'

-- FIXME:
--
-- LSP signature: no border, different BG
-- UI: thin colorcolumns / hl only overflowed
-- UI: rm EOF tildas as line numbers exists
-- cmp: DOCs background (no border)
-- LSP: diagnostics w/o border, different BG, show at single line or something
--
-- TODO:
--
-- cmp: better navigation pgup/pgdn
-- LSP: PHP better analysis
-- Regexp highlight
-- DB completion (w/connection)?
-- better navigation method
-- LSP: go to definition with ctrl+o buffer close if no changes?
--
-- NOTE:
--
-- PHP refactor: rename (not working at all), extract method?
-- PHP: sometimes cursor not indents on <CR>
