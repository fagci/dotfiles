local cmp = require'cmp'
local lspkind = require('lspkind')
local luasnip = require("luasnip")


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
			require("luasnip").lsp_expand(args.body)
		end,
	},
    sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "buffer" },
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
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
		end, { 'i', 's' }),


		['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
				cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { 'i', 's' }),


	},
	formatting = {
		format = lspkind.cmp_format({with_text=false, menu = ({
			buffer = "[B]",
			nvim_lsp = "[L]",
			luasnip = "[S]",
			calc = "[C]",
			path = "[P]",
			neorg = "[N]",
			emoji = "[E]",
			cmp_tabnine = "[T]",
		}),
	}),
},
})

