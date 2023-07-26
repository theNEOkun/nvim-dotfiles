local m = {
  ----Colors
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require "dumbfox"
    end
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      local onedark = require('onedark');
      onedark.setup({ style = 'darker' });
      onedark.load();
    end
  },
  {
    'rockerBOO/boo-colorscheme-nvim',
    config = function ()
    end
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  },
};

return { m };
