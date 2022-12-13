local keymap = require('utils').map
local cmd = require('utils').u_cmd;

local tstart = '<leader>f';
--Telescope
keymap('n', tstart .. 'f', '<cmd>Telescope find_files<cr>')
keymap('n', tstart .. 'g', '<cmd>Telescope live_grep<cr>')
keymap('n', tstart .. 'b', '<cmd>Telescope buffers<cr>')
keymap('n', tstart .. 'h', '<cmd>Telescope help_tags<cr>')

-- keymap('n', '<F10>a', '<cmd>:TestSuite<CR>');
-- keymap('n', '<F10>f', '<CMD>:TestFile<CR>');
-- keymap('n', '<F10>s', '<CMD>:TestNearest<CR>');

-- local teststart = '<leader>q';
-- keymap('n', teststart .. 'a', ':lua require("neotest").run.run({suite = true})<CR>');
-- keymap('n', teststart .. 'f', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>');
-- keymap('n', teststart .. 's', ':lua require("neotest").run.run()<CR>');

-- REST keymaps
keymap('n', '<leader>rt', '<Plug>RestNvim');
keymap('n', '<leader>rp', '<Plug>RestNvimPreview');

-- Command to create ctags
cmd('MakeTags', ':!ctags -R --exclude=node_modules --exclude="target/*" .');
