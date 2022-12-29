return {
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = require('plugins.config.c-kanagawa'),
        init = function()
            vim.cmd 'colorscheme kanagawa'
        end
    },
    { "SmiteshP/nvim-navic", config = {} },
    {
        'neovim/nvim-lspconfig',
        {
            'williamboman/nvim-lsp-installer',
            dependencies = "SmiteshP/nvim-navic",
            config = function()
                require('plugins.config.nvim-lspconfig')
            end
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require 'plugins.config.lualine'
        end,
        dependencies = {
            "SmiteshP/nvim-navic",
            'kyazdani42/nvim-web-devicons'
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'plugins.config.treesitter'
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    },
    {
        'ibhagwan/fzf-lua',
        config = require('plugins.config.fzf-lua')
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins.config.nvim-cmp')
            require('plugins.config.snippets')
        end,
        dependencies = {
            { 'onsails/lspkind-nvim' },
            { 'ray-x/lsp_signature.nvim' },
            { 'honza/vim-snippets' },
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-calc' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
        },
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = require('plugins.config.null-ls')
    },

    -- Editing
    'tpope/vim-repeat',
    'wellle/targets.vim',
    'ggandor/lightspeed.nvim',
    'machakann/vim-sandwich',
    'junegunn/vim-easy-align',
    {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = function()
            require('plugins.config.nvim-autopairs')
        end
    },
    { 'mattn/emmet-vim', ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } },
    { 'sbdchd/neoformat', cmd = 'Neoformat' },
    { 'andymass/vim-matchup', event = 'VimEnter' },
    { 'numToStr/Comment.nvim', config = require('plugins.config.comment') },

    -- Utils
    'gpanders/editorconfig.nvim',
    { 'vifm/vifm.vim', cmd = 'Vifm' },
    { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger', 'GitMessengerClose' } },
    { 'mhinz/vim-grepper', cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } },
    { 'Olical/vim-enmasse', cmd = 'EnMasse' },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },
    {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = {}
    },


    { 'chr4/nginx.vim', ft = 'nginx' },
    { 'nelsyeung/twig.vim', ft = 'twig' },

    -- UI
    {
        'crivotz/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = require('plugins.config.colorizer')
    },
    {
        'lukas-reineke/virt-column.nvim',
        config = {},
        event = 'BufReadPre',
    },

    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    },
    {
        'stevearc/aerial.nvim',
        config = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = 'BufEnter',
    },
    { 'j-hui/fidget.nvim', config = {} }
}
