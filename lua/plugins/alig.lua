local M = {
  'RRethy/nvim-align',
  config = function ()
    local util = require('utils');
    local map = util.map;

    map({'n'}, '<leader>a', function()
      local input = io.read("*l");
      return ':Align' .. input;
    end);
  end
};

return {M};
