return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim', opt = true}

	-- Syntax hl
	use {
		'nvim-treesitter/nvim-treesitter', 
		requires = {
			'nvim-treesitter/nvim-treesitter-refactor',
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		run = ':TSUpdate'
	}
	use {'nelsyeung/twig.vim', ft={'twig'}}
	use {'elixir-editors/vim-elixir', ft={'elixir'}}
	use {'chr4/nginx.vim', ft={'nginx'}}

	-- LSP
	use {
		"neovim/nvim-lspconfig",
		after = "nvim-lspinstall",
		config = [[require("config.nvim-lspconfig")]],
		requires = {
			{"kabouzeid/nvim-lspinstall", event = "BufRead"}
		}
	}

	-- Completion
	use 'onsails/lspkind-nvim'
	use 'ray-x/lsp_signature.nvim'
	use {'rafamadriz/friendly-snippets', event = 'InsertEnter'}

	use {
		'hrsh7th/nvim-cmp',
		after = 'friendly-snippets',
		config = [[require('config.nvim-cmp')]],
		requires = {'onsails/lspkind-nvim'},
		after = {'nvim-lspconfig'}
	}

	use {'hrsh7th/cmp-nvim-lsp', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-buffer', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-calc', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-path', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-vsnip', after = {'nvim-cmp'}}
	use {'hrsh7th/vim-vsnip', after = {'nvim-cmp'}}
	use {
		'windwp/nvim-autopairs',
		config = [[require('config.nvim-autopairs')]],
		after = 'nvim-cmp'
	}

	-- Editing
	use {'b3nj5m1n/kommentary', config = [[require('config.kommentary')]]}
	-- use 'tomtom/tcomment_vim'
	use {'godlygeek/tabular', cmd='Tabularize'}
	use {'sbdchd/neoformat', cmd='Neoformat'}
	use {'andymass/vim-matchup', event = 'VimEnter'}
	use 'mattn/emmet-vim'
	use 'tpope/vim-surround'
	use 'justinmk/vim-sneak'

	-- Utils
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'vifm/vifm.vim'
	use 'editorconfig/editorconfig-vim'
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = [[require("todo-comments").setup()]]
	}

	-- UI
	use "kyazdani42/nvim-web-devicons"
	use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	use {
		'crivotz/nvim-colorizer.lua', 
		ft = { 'css', 'javascript', 'php', 'html' },
		config = [[require('colorizer').setup {'css', 'javascript', 'php', 'html'}]]
	}

	-- TEST ZONE
	use 'rhysd/git-messenger.vim'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		cmd='NvimTreeToggle',
		config = [[require'nvim-tree'.setup{}]]
	}
	use { 
		"simrat39/symbols-outline.nvim",
		setup = function()
			vim.g.symbols_outline = {
				highlight_hovered_item = true,
				show_guides = true,
				auto_preview = true,
				position = "right",
				width = 25,
				show_numbers = false,
				show_relative_numbers = false,
				show_symbol_details = true,
				keymaps = {
					close = "q",
					goto_location  = "<CR>",
					focus_location = "<space>",
					hover_symbol   = "K",
					toggle_preview = "p",
					rename_symbol  = "r",
					code_actions   = "a",
				},
			}
		end,
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" }
	}

	use { 'Olical/vim-enmasse', cmd = 'EnMasse' }
	use 'kevinhwang91/nvim-bqf'

	use 'romainl/vim-cool'
	use 'wellle/targets.vim'



	use {
		{
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/popup.nvim',
				'nvim-lua/plenary.nvim',
				'telescope-frecency.nvim',
				'telescope-fzf-native.nvim',
			},
			wants = {
				'popup.nvim',
				'plenary.nvim',
				'telescope-frecency.nvim',
				'telescope-fzf-native.nvim',
			},
			-- setup = [[require('config.telescope_setup')]],
			config = [[require('config.telescope')]],
			cmd = 'Telescope',
			module = 'telescope',
		},
		{
			'nvim-telescope/telescope-frecency.nvim',
			after = 'telescope.nvim',
			requires = 'tami5/sql.nvim',
		},
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make',
		},
	}

end)
