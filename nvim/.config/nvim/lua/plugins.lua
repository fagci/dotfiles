local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function(use)
	use {'wbthomason/packer.nvim', opt = true}

	-- Syntax hl
	use 'nvim-treesitter/nvim-treesitter'
	use 'nelsyeung/twig.vim'
	use 'elixir-editors/vim-elixir'
	use 'chr4/nginx.vim'

	-- LSP

	use {
		"neovim/nvim-lspconfig",
		after = "nvim-lspinstall",
		config = function() require("config.nvim-lspconfig") end,
		requires = {
			{"kabouzeid/nvim-lspinstall", event = "BufRead"}
		}
	}



	-- Completion
	use 'onsails/lspkind-nvim'
	use {'rafamadriz/friendly-snippets', event = 'InsertEnter'}

	use {
		'hrsh7th/nvim-cmp',
		after = 'friendly-snippets',
		config = function() require('config.nvim-cmp') end,
		requires = {
			'onsails/lspkind-nvim',
		},
		after = {'nvim-lspconfig'}
	}

	use {'hrsh7th/cmp-path', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-nvim-lsp', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-buffer', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-vsnip', after = {'nvim-cmp'}}
	use {'hrsh7th/vim-vsnip', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-cmdline', after = {'nvim-cmp'}}
	use {'hrsh7th/cmp-calc', after = {'nvim-cmp'}}
	use {
		'windwp/nvim-autopairs',
		config = function() require('config.nvim-autopairs') end,
		after = 'nvim-cmp'
	}

	-- Editing
	use {
		'b3nj5m1n/kommentary', 
		config = function() require('config.kommentary') end
	}
	use 'godlygeek/tabular'
	use 'mattn/emmet-vim'
	use 'sbdchd/neoformat'
	use 'tpope/vim-surround'
	use 'ray-x/lsp_signature.nvim'
	use {'andymass/vim-matchup', event = 'VimEnter'}
	use 'ethanholz/nvim-lastplace'

	-- Utils
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

	use 'vifm/vifm.vim'
	use 'editorconfig/editorconfig-vim'

	-- UI
	-- use 'RRethy/nvim-base16'
	use 'sainnhe/everforest'

	-- TEST ZONE
	use 'rhysd/git-messenger.vim'


	use { 'kyazdani42/nvim-web-devicons' }
	use {
		'yamatsum/nvim-nonicons',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require('config.lualine') end
	}
end)
