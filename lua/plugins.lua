return { -- 'vim-airline/vim-airline'
  {
    'kyazdani42/nvim-web-devicons',
    config = function() require("nvim-web-devicons").setup() end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  --  'tpope/vim-surround'
  {
    'kylechui/nvim-surround',
    config = function() require("nvim-surround").setup() end
  },
  --  'fladson/vim-kitty'
  -- require('autopairs')

  ----RipGrep
  {
    'jremmen/vim-ripgrep',
    cmd = 'Rg'
  },
}
