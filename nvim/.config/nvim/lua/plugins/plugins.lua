local packer = require('packer')
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Syntax hl
    use { 'chr4/nginx.vim', ft = 'nginx' }
    use { 'nelsyeung/twig.vim', ft = 'twig' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[require('plugins.config.treesitter')]],
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        config = [[
        require('plugins.config.nvim-cmp')
        require('plugins.config.snippets')
        ]],
        requires = {
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
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        {
            'williamboman/nvim-lsp-installer',
            config = [[require('plugins.config.nvim-lspconfig')]],
        }
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[require('plugins.config.null-ls')]]
    }

    -- Editing
    use 'tpope/vim-repeat'
    use 'wellle/targets.vim'
    use 'ggandor/lightspeed.nvim'
    -- use 'machakann/vim-sandwich'
    use { 'junegunn/vim-easy-align' }
    use {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = [[require('plugins.config.nvim-autopairs')]],
    }
    use { 'mattn/emmet-vim', ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } }
    use { 'sbdchd/neoformat', cmd = 'Neoformat' }
    use { 'andymass/vim-matchup', event = 'VimEnter' }
    use { 'numToStr/Comment.nvim', config = [[require('plugins.config.comment')]] }

    -- Utils
    use 'gpanders/editorconfig.nvim'
    use { 'vifm/vifm.vim', cmd = 'Vifm' }
    use { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger', 'GitMessengerClose' } }
    use { 'mhinz/vim-grepper', cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } }
    use { 'Olical/vim-enmasse', cmd = 'EnMasse' }
    use { 'ibhagwan/fzf-lua', config = [[require('plugins.config.fzf-lua')]] }
    use { 'monaqa/dial.nvim', config = [[require('plugins.config.dial')]] }
    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[require("trouble").setup()]]
    }

    -- UI
    use {
        'crivotz/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = [[require('plugins.config.colorizer')]]
    }
    use {
        'lukas-reineke/virt-column.nvim',
        config = [[require("virt-column").setup()]],
        event = 'BufReadPre',
    }

    -- colorschemes
    use {
        'rebelot/kanagawa.nvim',
        config = [[
            require('kanagawa').setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                variablebuiltinStyle = { italic = false },
            })
        ]]
    }

    -- test zone
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    }
    use {
        'stevearc/aerial.nvim',
        config = [[require('aerial').setup()]],
        requires = { 'nvim-treesitter/nvim-treesitter' },
        event = 'BufEnter',
    }
    use { 'j-hui/fidget.nvim', config = [[require"fidget".setup{}]] }
    use {
        'kosayoda/nvim-lightbulb',
        config = [[require('nvim-lightbulb').setup({autocmd = {enabled = true}})]],
        requires = 'antoinemadec/FixCursorHold.nvim',
    }

    if packer_bootstrap then
        packer.sync()
    end
end)
