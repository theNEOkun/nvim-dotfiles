local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	--Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function() require("telescope-conf") end,
	}
	--LSP
	use {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		{
			--Autocomplete
			'ms-jpq/coq_nvim',
			requires = {
				'ms-jpq/coq.artifacts',
				'ms-jpq/coq.thirdparty',
				config = function() require('coq_3p') {
						{ src = 'dap' },
						{ src = "nvimlua", short_name = "nLUA", conf_only = true }
					}
				end
			},
		},
		config = require('lsp-conf')
	}

	-- use 'kosayoda/nvim-lightbulb'

	--TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/nvim-treesitter-refactor',
			'windwp/nvim-ts-autotag',
			'p00f/nvim-ts-rainbow',
			'RRethy/nvim-treesitter-endwise',
			'RRethy/nvim-treesitter-textsubjects',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
		config = function() require('treesitter-conf').setup() end,
		run = ':TSUpdate',
	}

	use {
		'tpope/vim-dispatch'
	}

	--Debugging

	use {
		{
			'rcarriga/nvim-dap-ui',
			config = require('dapui').setup(),
			requires = 'mfussenegger/nvim-dap',
		},
		{
			'theHamsta/nvim-dap-virtual-text',
			config = function()
				M = require('nvim-dap-virtual-text').setup();
				require('dap.dap_init');
				return M;
			end,
			requires = 'mfussenegger/nvim-dap'

		}
	}

	use {
		'jbyuki/one-small-step-for-vimkind'
	}


	--Specific
	----Rust
	use {
		{
			'simrat39/rust-tools.nvim',
			requires = {
				'mfussenegger/nvim-dap',
				'nvim-lua/plenary.nvim'
			}

		},
		'rust-lang/rust.vim',
		'ron-rs/ron.vim'

	}

	use 'elkowar/yuck.vim'

	----C/C++
	use 'p00f/clangd_extensions.nvim'

	--Tree
	use {
		'nvim-neo-tree/neo-tree.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		config = require('neoTree').setup,
	}

	use 'preservim/tagbar'

	----Line
	--use 'vim-airline/vim-airline'
	use {
		'kyazdani42/nvim-web-devicons',
		config = function() require("nvim-web-devicons").setup() end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		},
		config = function()
			require('line')
		end
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	----GIT
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

	----Surrounding
	use 'tpope/vim-surround'
	use 'fladson/vim-kitty'

	-- TODO things to do
	use {
		'folke/todo-comments.nvim',
		config = function() require("todo-conf").setup() end
	}

	--require('autopairs')
	use 'jiangmiao/auto-pairs'

	----RipGrep
	use 'jremmen/vim-ripgrep'

	----Colors
	use {
		'lunarvim/Onedarker.nvim',
		'NTBBloodbath/doom-one.nvim',
		'EdenEast/nightfox.nvim',
	}

	use {
		'norcalli/nvim-base16.lua',
	}

	use {
		'NvChad/nvim-colorizer.lua',
		config = function() require('colorizer').setup() end
	}

	use 'ThePrimeagen/vim-be-good'

end)
