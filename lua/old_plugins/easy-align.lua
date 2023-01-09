return {
  'junegunn/vim-easy-align',
  config = function()
    local keymap = require('utils').map;
    keymap({ 'n', 'x' }, '<leader>ea', '<Plug>(EasyAlign)', { desc = "[E]asy [A]lign" });
  end
}
