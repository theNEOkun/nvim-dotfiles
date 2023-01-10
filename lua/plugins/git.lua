local M = {
  'lewis6991/gitsigns.nvim',
  config = function()
    local git = require('gitsigns');
    git.setup();
  end
};

return { M,
  { 'tpope/vim-fugitive' },
};
