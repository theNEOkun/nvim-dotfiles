return {
  ----Colors
  {
    'lunarvim/Onedarker.nvim',
  },
  {
    'olimorris/onedarkpro.nvim',
    function() require('onedarkpro').setup({
        dark_theme = "onedark_vivid"
      })
    end
  },
  {

    'NTBBloodbath/doom-one.nvim',
  },
  {
    'EdenEast/nightfox.nvim',
    function()
      require "dumbfox"
      vim.cmd('colorscheme nightfox');
    end
  },

  {
    'NvChad/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  },
}
