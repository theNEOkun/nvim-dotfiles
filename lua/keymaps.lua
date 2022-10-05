local keymap = require('utils').map
--General

--Tabs
--Next
keymap('n', '<A-t>', '<cmd>:tabn<CR>')
--New
keymap('n', '<A-e>', '<cmd>:tabe<CR>')
--Close
keymap('n', '<A-q>', '<cmd>:tabc<CR>')

--Increment and Decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

--Copy visually selected to clipboard
keymap('x', '<C-c>', '"+y', {})

--Paste from clipboard
keymap('n', '<C-p>', '"+p', {})
keymap('x', '<C-p>', '"+p', {})

-- save
keymap('n', '<C-s>', ':wa<CR>')
keymap('i', '<C-s>', '<C-o>:wa<CR>')

--move text
keymap('n', '<C-j>', ':m .+1<CR>==')
keymap('n', '<C-k>', ':m .-2<CR>==')
keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv")
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- ENter just a line
keymap('n', '<leader>o', 'o<ESC>');
keymap('n', '<leader>O', 'O<ESC>');
keymap('v', '<leader>o', 'o<ESC>');
keymap('v', '<leader>O', 'O<ESC>');

-- Remove arrow-keys
keymap('n', '<Up>', '<Nop>')
keymap('n', '<Down>', '<Nop>')
keymap('n', '<Left>', '<Nop>')
keymap('n', '<Right>', '<Nop>')
