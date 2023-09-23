local M = {
  ----Colors
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require("dumbfox")
    end
  },
  {
    'navarasu/onedark.nvim',
    enabled = false,
    config = function()
      local onedark = require('onedark');
      onedark.setup({ style = 'darker' });
      onedark.load();
    end
  },
  {
    'rockerBOO/boo-colorscheme-nvim',
    enabled = false,
    config = function ()
    end
  },
  {
    'NvChad/nvim-colorizer.lua',
    enabled = false,
    config = function() require('colorizer').setup() end
  },
};

return { M };
