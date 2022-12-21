local m = {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local mark = require('harpoon.mark');
    local ui = require('harpoon.ui');
    local keymap = require('utils').map;

    local start = '<leader>h';
    keymap('n', start .. 'a', mark.add_file, { desc = "[H]arp [A]dd a file to the harpoon" });
    keymap('n', start .. 't', ui.toggle_quick_menu, { desc = "[H]arp [T]oggle the menu" });
    keymap('n', start .. 'y', function() ui.nav_file(1) end, { desc = "Go to [H]arp file 1" });
    keymap('n', start .. 'u', function() ui.nav_file(2) end, { desc = "Go to [H]arp file 2" });
    keymap('n', start .. 'i', function() ui.nav_file(3) end, { desc = "Go to [H]arp file 3" });
    keymap('n', start .. 'o', function() ui.nav_file(4) end, { desc = "Go to [H]arp file 4" });
  end
}

return { m };
