local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	completion = { completeopt = 'menu,menuone,noinsert' },
	mapping = {
		['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<PageUp>"] = function(fallback)
			for i = 1, 10 do
				cmp.mapping.select_prev_item()(nil)
			end
		end,
		["<PageDown>"] = function(fallback)
			for i = 1, 10 do
				cmp.mapping.select_next_item()(nil)
			end
		end,
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	experimental = { ghost_text = false, custom_menu = true },
	formatting = {
		format = lspkind.cmp_format({with_text=false, menu = ({
			buffer = "[B]",
			nvim_lsp = "[L]",
			vsnip = "[S]",
			calc = "[C]",
			path = "[P]",
			neorg = "[N]",
			cmp_tabnine = "[T]",
		}),
	}),
},
sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'calc' },
	{ name = 'vsnip' },
}, {
	{ name = 'buffer' },
})
})

cmp.setup.cmdline('/', {sources = {{ name = 'buffer' }}})
cmp.setup.cmdline(':', {sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})})

