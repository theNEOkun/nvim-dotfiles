require("bootstrap")
require("dep") {
  modules = {
    prefix = "packages.",
    'lsp-conf.init',
    'dap.init',
    'line',
    'eyeline',
    -- 'neoTree',
    'netrw',
    'telescope-conf',
    'treesitter-conf',
    'todo-conf',
    'colors',
    'rest',
    'autopairs',
    'which',
    'projections',
    'rust',
    'clangd',
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
  ----C/C++

  -- JS

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
  -- require('autopairs')

  ----RipGrep
  {
    'jremmen/vim-ripgrep'
  },
  {
    'ThePrimeagen/vim-be-good'
  },
}
