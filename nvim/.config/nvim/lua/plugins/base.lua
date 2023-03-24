return {
    { 'folke/lazy.nvim' },

    {
        "rebelot/kanagawa.nvim",
        config = {
            compile = true,
            colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
        },
        init = function()
            vim.cmd.colorscheme "kanagawa"
        end
    },

    {
        "kyazdani42/nvim-web-devicons",
        opts = { color_icons = false },
        config = true,
    },
    { 'chr4/nginx.vim',     ft = 'nginx' },
    { 'nelsyeung/twig.vim', ft = 'twig' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/neodev.nvim',
            'j-hui/fidget.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
            },
            'williamboman/mason-lspconfig.nvim',
            'ray-x/lsp_signature.nvim',
        },
        config = function()
            require('plugins.config.nvim-lspconfig')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require 'plugins.config.treesitter'
            require("treesitter-context").setup()
            require('plugins.config.nvim-autopairs')
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
            'windwp/nvim-autopairs',
            'windwp/nvim-ts-autotag',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = function()
            require('plugins.config.nvim-cmp')
            require('plugins.config.snippets')
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
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins.config.null-ls')
        end
    },
    {
        'ibhagwan/fzf-lua',
        config = require('plugins.config.fzf-lua'),
        cmd = 'FzfLua'
    },
    -- Editing
    'tpope/vim-repeat',
    'wellle/targets.vim',
    'machakann/vim-sandwich',
    { 'mattn/emmet-vim',  ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } },
    { 'sbdchd/neoformat', cmd = 'Neoformat' },
    {
        'numToStr/Comment.nvim',
        config = function() require('plugins.config.comment') end,
    },
    -- Utils
    'gpanders/editorconfig.nvim',
    { 'vifm/vifm.vim',           cmd = 'Vifm' },
    { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger', 'GitMessengerClose' } },
    { 'mhinz/vim-grepper',       cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } },
    { 'Olical/vim-enmasse',      cmd = 'EnMasse' },
    {
        'mbbill/undotree',
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        cmd = 'UndotreeToggle',
    },
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = {},
    },
    -- UI
    {
        'NvChad/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = require('plugins.config.colorizer')
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        cmd = { 'NeoTreeShow', 'NeoTreeShowToggle', 'NeoTreeReveal', 'NeoTreeRevealToggle' }
    },
    {
        'stevearc/aerial.nvim',
        config = {},
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        cmd = { 'AerialToggle' }
    },
    {
        'folke/which-key.nvim',
        config = {}
    },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = {},
    },

    {
        "stevearc/overseer.nvim",
        event = "BufReadPre",
        opts = {},
        config = function()
            require("overseer").setup()
        end,
    },
    {
        "dnlhc/glance.nvim",
        event = "BufReadPre",
        config = true,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = { snippet_engine = "luasnip" },
        event = "BufReadPre",
    }


}
