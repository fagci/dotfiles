require 'disable_builtins'
require 'options'
require 'commands'
require 'mappings'

require 'init_packer'

require 'plugins'
require 'styles'

-- FIXME:
--
-- UI: LSP signature: no border, different BG
-- UI: cmp: DOCs background (no border)
-- UI: rm EOF tildas as line numbers exists
-- UI: thin colorcolumns / hl only overflowed
--
-- TODO:
--
-- cmp: better navigation pgup/pgdn
-- Regexp highlight
-- DB completion (w/connection)?
-- LSP: go to definition with ctrl+o buffer close if no changes?
--
-- NOTE:
--
-- PHP refactor: rename (not working at all), extract method?
-- PHP: sometimes cursor not indents on <CR>
