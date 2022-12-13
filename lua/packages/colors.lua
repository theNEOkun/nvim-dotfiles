return {
  ----Colors
  {
    'lunarvim/Onedarker.nvim',
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
