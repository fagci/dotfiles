return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim', opt = true}

	-- Syntax hl
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', event = "BufRead"}
	use {'nelsyeung/twig.vim', ft={'twig'}}
	use {'elixir-editors/vim-elixir', ft={'elixir'}}
	use {'chr4/nginx.vim', ft={'nginx'}}

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
	use 'ray-x/lsp_signature.nvim'
	use {'rafamadriz/friendly-snippets', event = 'InsertEnter'}

	use {
		'hrsh7th/nvim-cmp',
		after = 'friendly-snippets',
		config = function() require('config.nvim-cmp') end,
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
		config = function() require('config.nvim-autopairs') end,
		after = 'nvim-cmp'
	}

	-- Editing
	use {
		'b3nj5m1n/kommentary', 
		config = function() require('config.kommentary') end
	}
	use {'godlygeek/tabular', cmd='Tabularize'}
	use {'sbdchd/neoformat', cmd='Neoformat'}
	use {'andymass/vim-matchup', event = 'VimEnter'}
	use 'mattn/emmet-vim'
	use 'tpope/vim-surround'
	use 'ethanholz/nvim-lastplace'

	-- Utils
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'vifm/vifm.vim'
	use 'editorconfig/editorconfig-vim'

	-- UI
	use 'RRethy/nvim-base16'
	use "kyazdani42/nvim-web-devicons"

	-- TEST ZONE
	use 'rhysd/git-messenger.vim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'nvim-tree'.setup {} end
	}

	use { "simrat39/symbols-outline.nvim",
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


require'nvim-lastplace'.setup{}	
end)
