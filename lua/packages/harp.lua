local m = {
  'ThePrimeagen/harpoon',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  function()
    local mark = require('harpoon.mark');
    local ui = require('harpoon.ui');
    local keymap = require('utils').map;

    local start = '<leader>h';
    keymap('n', start .. 'a', mark.add_file, { desc = "Add a file to the harpoon" });
    keymap('n', start .. 'e', ui.toggle_quick_menu, { desc = "Toggle the menu" });
    keymap('n', start .. 'y', function() ui.nav_file(1) end, { desc = "Go to file 1" });
    keymap('n', start .. 'u', function() ui.nav_file(2) end, { desc = "Go to file 2" });
    keymap('n', start .. 'i', function() ui.nav_file(3) end, { desc = "Go to file 3" });
    keymap('n', start .. 'o', function() ui.nav_file(4) end, { desc = "Go to file 4" });
  end
}

return { m };
