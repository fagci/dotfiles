local cmp = require'cmp'
local lspkind = require('lspkind')


local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end


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
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn['vsnip#available']() == 1 then
				feedkey('<Plug>(vsnip-expand-or-jump)', '')
			elseif has_words_before() then
				cmp.complete()
			else
				-- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
				fallback()
			end
		end, { 'i', 's' }),


		['<S-Tab>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn['vsnip#jumpable'](-1) == 1 then
				feedkey('<Plug>(vsnip-jump-prev)', '')
			end
		end, { 'i', 's' }),


	},
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

