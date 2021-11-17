return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    -- Syntax hl
    use {'chr4/nginx.vim', ft={'nginx'}}
    use {'nelsyeung/twig.vim', ft={'twig'}}
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        after = 'nvim-lspinstall',
        config = [[require('config.nvim-lspconfig')]],
        requires = {
            {'kabouzeid/nvim-lspinstall', event = 'BufRead'}
        }
    }

    -- Completion
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'rafamadriz/friendly-snippets'


    use {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter *',
        after='friendly-snippets',
        config = [[require('config.nvim-cmp')]],
        requires = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer' , after='nvim-cmp'},
            { 'hrsh7th/cmp-nvim-lsp' , after='nvim-cmp'},
            { 'hrsh7th/cmp-path' , after='nvim-cmp'},
            { 'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
            { "hrsh7th/cmp-calc" , after='nvim-cmp'},
        },
    }

    use {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = [[require('config.nvim-autopairs')]],
    }

    -- Editing
    use {'mattn/emmet-vim', ft = {'html', 'css', 'htmldjango', 'twig', 'php'}}
    use 'wellle/targets.vim'
    use 'justinmk/vim-sneak'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'AndrewRadev/splitjoin.vim' -- gS, gJ
    use 'AndrewRadev/sideways.vim'
    use {'sbdchd/neoformat', cmd='Neoformat'}
    use {'godlygeek/tabular', cmd='Tabularize'}
    use {'andymass/vim-matchup', event = 'VimEnter'}
    use {'b3nj5m1n/kommentary', config = [[require('config.kommentary')]]}

    -- Utils
    use 'vifm/vifm.vim'
    use 'romainl/vim-cool'
    use 'gennaro-tedesco/nvim-peekup'
    use 'rhysd/git-messenger.vim'
    use 'editorconfig/editorconfig-vim'
    use {'junegunn/fzf.vim', requires = {'junegunn/fzf'}, run = function() vim.fn['fzf#install']() end}
    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require("trouble").setup()]]
    }
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[require('todo-comments').setup()]]
    }

    -- UI
    use 'kyazdani42/nvim-web-devicons'
    use {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
    use 'sainnhe/sonokai'
    use {
        'crivotz/nvim-colorizer.lua', 
        ft = { 'css', 'javascript', 'php', 'html' },
        config = [[require('colorizer').setup {'css', 'javascript', 'php', 'html'}]]
    }

    -- TEST ZONE
    use {
        'kyazdani42/nvim-tree.lua',
        cmd='NvimTreeToggle',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[require'nvim-tree'.setup{}]]
    }
    use { 
        'simrat39/symbols-outline.nvim',
        setup = [[require'config.symbols-outline']],
        cmd = {'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose'}
    }

    use {'Olical/vim-enmasse', cmd = 'EnMasse'}
    use 'kevinhwang91/nvim-bqf'

    use 'mhinz/vim-grepper'
end)

