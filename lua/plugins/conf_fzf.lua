local M = {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('fzf-lua').setup({});

    local keymap = require('utils').map;


    local start = '<leader>f';
    keymap({'n'}, start..'f', '<cmd>lua require("fzf-lua").grep()<CR>', { desc = 'Quickly open grep'});
    keymap({'n'}, start..'t', '<cmd>lua require("fzf-lua").files()<CR>', { desc = 'Quickly open grep'});
    keymap({'n'}, start..'g', '<cmd>lua require("fzf-lua").git_files()<CR>', { desc = 'Quickly open grep'});
  end
}


return { M };
