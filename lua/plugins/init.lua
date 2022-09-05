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
		config = require('telescope').setup {
			defaults = {
				file_ignore_patterns = { "node_modules" }
			}
		},
		requires = {
			'nvim-lua/plenary.nvim'
		},
		{
			'nvim-telescope/telescope-fzy-native.nvim'
		},
	}
	--LSP
	use {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		{
			--Autocomplete

			'ms-jpq/coq_nvim',
			{
				'ms-jpq/coq.artifacts'
			},
			{
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

	use 'kosayoda/nvim-lightbulb'

	--TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		config = require('treesitter-conf'),
		run = ':TSUpdate',
		{
			'nvim-treesitter/nvim-treesitter-refactor'
		},
		{
			'windwp/nvim-ts-autotag',
		},
		{
			'p00f/nvim-ts-rainbow'
		},
		{
			'RRethy/nvim-treesitter-endwise'
		}
	}

	--Test
	use {
		"nvim-neotest/neotest",
		{
			{
				"nvim-neotest/neotest-vim-test",
				requires = {
					"vim-test/vim-test"
				},
				config = function() require("neotest-vim-test")({ ignore_filetypes = {} }) end,
			},
			{
				"nvim-neotest/neotest-plenary",
				"rouge8/neotest-rust"
			},
		},
		config = function() require('neotest').setup({
				adapters = {
					require("neotest-rust"),
					require("neotest-plenary")
				}
			})
		end,
	}

	use {
		'tpope/vim-dispatch'
	}

	--Debugging

	use {
		'rcarriga/nvim-dap-ui',
		config = require('dapui').setup(),
		requires = 'mfussenegger/nvim-dap'
	}

	use {
		'Pocco81/dap-buddy.nvim',
	}

	use {
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			M = require('nvim-dap-virtual-text').setup();
			require('dap.dap_init');
			return M;
		end,
		requires = 'mfussenegger/nvim-dap'
	}

	use {
		'jbyuki/one-small-step-for-vimkind'
	}


	--Specific
	----Rust
	use {
		'simrat39/rust-tools.nvim',
		requires = {
			'mfussenegger/nvim-dap',
			'nvim-lua/plenary.nvim'
		}
	}

	use 'rust-lang/rust.vim'
	use 'ron-rs/ron.vim'

	----eww
	use 'elkowar/yuck.vim'

	----C/C++
	use 'p00f/clangd_extensions.nvim'
	--Others
	use {
		'kyazdani42/nvim-tree.lua',
		config = require('nvim-tree').setup({
			git = {
				ignore = false,
			},
		}),
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
	}

	use 'preservim/tagbar'

	----Line
	--use 'vim-airline/vim-airline'
	use 'ryanoasis/vim-devicons'

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

	--require('autopairs')
	use 'jiangmiao/auto-pairs'

	----RipGrep
	use 'jremmen/vim-ripgrep'

	----Colors
	use {
		'marko-cerovac/material.nvim',
		'catppuccin/nvim',
		{
			'mcchrish/zenbones.nvim',
			requires = 'rktjmp/lush.nvim'
		},
		'folke/tokyonight.nvim',
		'EdenEast/nightfox.nvim',
		'NTBBloodbath/doom-one.nvim'
	}

end)
