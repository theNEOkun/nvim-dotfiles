local keymap = require('utils').map
local keymap_func = require('utils').map_func

--Tagbar
keymap('n', '<F8>', '<cmd>:TagbarToggle<CR>')

--Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

keymap('n', '<F10>a', '<cmd>:TestSuite<CR>');
keymap('n', '<F10>f', '<CMD>:TestFile<CR>');
keymap('n', '<F10>s', '<CMD>:TestNearest<CR>');
