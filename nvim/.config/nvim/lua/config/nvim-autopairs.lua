require('nvim-autopairs').setup()
-- insert `(` after select function or method item
local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
