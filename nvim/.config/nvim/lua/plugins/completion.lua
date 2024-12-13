return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = function()
            local cmp = require 'cmp'
            local lspkind = require 'lspkind'
            local luasnip = require 'luasnip'

            cmp.setup({
                completion = {
                    keyword_length = 2,
                    completeopt = 'menu,menuone,noinsert',
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                }, {
                        { name = 'path' },
                        { name = 'calc' },
                    }),
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    ['<Down>'] = cmp.mapping.select_next_item(),
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ["<PageUp>"] = function(fallback)
                        if cmp.visible() then
                            for _ = 1, 8 do
                                cmp.mapping.select_prev_item()(nil)
                            end
                        else
                            fallback()
                        end
                    end,
                    ["<PageDown>"] = function(fallback)
                        if cmp.visible() then
                            for _ = 1, 8 do
                                cmp.mapping.select_next_item()(nil)
                            end
                        else
                            fallback()
                        end
                    end,
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-y>'] = cmp.config.disable,
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = lspkind.cmp_format({
                        with_text = false,
                        menu = ({
                            buffer = '[B]',
                            nvim_lsp = '[L]',
                            luasnip = '[S]',
                            calc = '[C]',
                            path = '[P]',
                            neorg = '[N]',
                            emoji = '[E]',
                            treesitter = '[T]',
                        }),
                    }),
                },
                experimental = {
                    ghost_text = true,
                },
            })


            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        dependencies = {
            'onsails/lspkind-nvim',
            'honza/vim-snippets',
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
    },
}
