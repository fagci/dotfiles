return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    -- Syntax hl
    use { 'chr4/nginx.vim', ft = 'nginx' }
    use { 'nelsyeung/twig.vim', ft = 'twig' }
    use { 'alaviss/nim.nvim', ft = 'nim' }
    use { 'othree/yajs.vim', ft = 'js' }
    use { 'othree/html5.vim', ft = {'html', 'php'} }

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
        {
            'williamboman/nvim-lsp-installer',
            config = [[require('config.nvim-lspconfig')]],
        }
    }

    -- Completion
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'honza/vim-snippets'

    use {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter *',
        after = 'vim-snippets',
        config = [[require('config.nvim-cmp')]],
        requires = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { "hrsh7th/cmp-calc", after = 'nvim-cmp' },
        },
    }

    use {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = [[require('config.nvim-autopairs')]],
    }

    -- Editing
    use { 'mattn/emmet-vim', ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } }
    use 'wellle/targets.vim'
    use 'justinmk/vim-sneak'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'AndrewRadev/splitjoin.vim' -- gS, gJ
    use 'AndrewRadev/sideways.vim'
    use { 'sbdchd/neoformat', cmd = 'Neoformat' }
    use { 'godlygeek/tabular', cmd = 'Tabularize' }
    use { 'andymass/vim-matchup', event = 'VimEnter' }
    use { 'numToStr/Comment.nvim', config = [[require('config.comment')]] }

    -- Utils
    use 'vifm/vifm.vim'
    use 'romainl/vim-cool'
    use 'gennaro-tedesco/nvim-peekup'
    use 'rhysd/git-messenger.vim'
    use 'mhinz/vim-grepper'
    use { 'Olical/vim-enmasse', cmd = 'EnMasse' }
    use 'editorconfig/editorconfig-vim'
    use { 'ibhagwan/fzf-lua', config = [[require('config.fzf-lua')]] }
    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }
    use {
        -- "folke/trouble.nvim",
        "bellini666/trouble.nvim",
        commit = "4d031d09814dc83cb5b75b84b84944b93c0bcdcb",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require("trouble").setup()]]
    }
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[require('todo-comments').setup()]]
    }

    -- colorschemes
    use 'rmehri01/onenord.nvim'
    use 'cpea2506/one_monokai.nvim'
    use 'mhartington/oceanic-next'

    use {
        'crivotz/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = [[require('config.colorizer')]]
    }

    -- TEST ZONE
    use 'lewis6991/nvim-treesitter-context'
    use 'elihunter173/dirbuf.nvim' -- fm as text
    use 'nvim-lua/lsp-status.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config=[[
            require('lualine').setup {
              options = {
                icons_enabled = false,
                theme = 'OceanicNext',
                component_separators = false,
                section_separators = {},
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = false,
              },
              sections = {
                lualine_a = {'quickfix'},
                lualine_b = {function() return require('lsp-status').status() end},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'filetype'},
                lualine_y = {},
                lualine_z = {'location'}
              },
              inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
              },
              tabline = {},
              extensions = {}
            }
        ]]
    }
end)
