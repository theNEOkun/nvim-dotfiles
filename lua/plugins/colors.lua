return {
  ----Colors
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require "dumbfox"
      vim.cmd('colorscheme nightfox');
    end
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  },
}
