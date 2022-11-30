require("bootstrap")
require("dep") {
  modules = {
    prefix = "packages.",
    'lsp-conf.init',
    'dap.dap_init',
    'line',
    'neoTree',
    'telescope-conf',
    'treesitter-conf',
    'todo-conf',
    'colors',
    'rest',
  },

  --  'kosayoda/nvim-lightbulb'

  {
    'tpope/vim-dispatch'
  },

  --Debugging

  {
    'jbyuki/one-small-step-for-vimkind'
  },

  --Specific
  ----Rust
  {
    'simrat39/rust-tools.nvim',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-lua/plenary.nvim',
      'rust-lang/rust.vim',
      'ron-rs/ron.vim'
    },
  },

  --  'mfussenegger/nvim-jdtls';

  ----C/C++

  {
    'p00f/clangd_extensions.nvim'
  },
  -- JS

  {
    'preservim/tagbar'
  },

  ----Line
  -- 'vim-airline/vim-airline'
  {
    'kyazdani42/nvim-web-devicons',
    config = function() require("nvim-web-devicons").setup() end,
  },
  {
    'numToStr/Comment.nvim',
    function()
      require('Comment').setup()
    end
  },

  ----GIT
  {
    'airblade/vim-gitgutter'
  },
  {
    'tpope/vim-fugitive'
  },

  ----Surrounding
  --  'tpope/vim-surround'
  {
    'kylechui/nvim-surround',
    function() require("nvim-surround").setup() end
  },
  --  'fladson/vim-kitty'
  --require('autopairs')
  {
    'jiangmiao/auto-pairs'
  },

  ----RipGrep
  {
    'jremmen/vim-ripgrep'
  },
  {
    'ThePrimeagen/vim-be-good'
  },
}
