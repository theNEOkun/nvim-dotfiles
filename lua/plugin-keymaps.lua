local keymap = require('utils').map
local cmd = require('utils').u_cmd;

--Tagbar
keymap('n', '<F8>', '<cmd>:TagbarToggle<CR>')

--Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- keymap('n', '<F10>a', '<cmd>:TestSuite<CR>');
-- keymap('n', '<F10>f', '<CMD>:TestFile<CR>');
-- keymap('n', '<F10>s', '<CMD>:TestNearest<CR>');

keymap('n', '<F10>a', ':lua require("neotest").run.run({suite = true})<CR>');
keymap('n', '<F10>f', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>');
keymap('n', '<F10>s', ':lua require("neotest").run.run()<CR>');

-- REST keymaps
keymap('n', '<leader>rt', '<Plug>RestNvim');
keymap('n', '<leader>rp', '<Plug>RestNvimPreview');

-- Command to create ctags
cmd('MakeTags', ':!ctags -R --exclude=node_modules --exclude="target/*" .');

keymap({ 'n' }, 'tt', '<cmd>:TodoQuickFix<cr>');
