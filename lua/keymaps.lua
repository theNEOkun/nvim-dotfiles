local keymap = require('utils').map;
--General

local cmd = require('utils').u_cmd;
-- Command to create ctags
cmd('MakeTags', ':!ctags -R --exclude=node_modules --exclude="target/*" .');

-- require('utils').map('n', '<space>', '<nop>');
-- g.mapleader = " ";

-- Edit vim
keymap({ 'n' }, '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>');
keymap({ 'n' }, '<leader>vr', ':source ~/.config/nvim/init.lua<cr>');

--Tabs
--Next
keymap('n', 'tn', '<cmd>:tabn<CR>', { desc = "Go to the next tab" });
--Prev
keymap('n', 'tp', '<cmd>:tabp<CR>', { desc = "Go to the previous tab" });
--New
keymap('n', 'te', '<cmd>:tabe<CR>', { desc = "Open a new tab" });
--Close
keymap('n', 'tc', '<cmd>:tabc<CR>', { desc = "Close the current tab" });

--Increment and Decrement
keymap('n', '+', '<C-a>', { desc = "Increment the first number in the line" });
keymap('n', '-', '<C-x>', { desc = "Decrement the first number in the line" });

--Copy visually selected to clipboard
keymap('x', '<C-c>', '"+y', { desc = "Copy visual selection to system clipboard" });

--Paste from clipboard
keymap({ 'n', 'x' }, '<C-p>', '"+p', { desc = "Paste from the clipboard" });

-- save
keymap('n', '<C-s>', ':updatea<CR>', { desc = "Save all files" });
keymap('i', '<C-s>', '<C-o>:updatea<CR>', { desc = "Save all file" });

--move text
keymap('n', '<C-j>', ':m .+1<CR>==', { desc = "Move lines down in normal mode" });
keymap('n', '<C-k>', ':m .-2<CR>==', { desc = "Move lines up in normal mode" });
keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi', { desc = "Move lines down in insertmode" });
keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi', { desc = "Move lines up in insertmode" });
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = "Move the visually chosen lines down" });
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = "Move the visually chosen lines up" });

-- ENter just a line
keymap({ 'n', 'v' }, '<leader>o', 'o<ESC>j', { desc = "Enter a new line below" });
keymap({ 'n', 'v' }, '<leader>O', 'O<ESC>k', { desc = "Enter a new line above" });

-- Remove arrow-keys
keymap({ 'n', 'v' }, '<Up>', '<Nop>', { desc = "Remove the up-button" });
keymap({ 'n', 'v' }, '<Down>', '<Nop>', { desc = "Remove the down-button" });
keymap({ 'n', 'v' }, '<Left>', '<Nop>', { desc = "Remove the left-button" });
keymap({ 'n', 'v' }, '<Right>', '<Nop>', { desc = "Remove the right-button" });

-- Go To Tag
keymap({ 'n' }, 'gt', '<c-]>', { desc = "GoTo tag" });
keymap({ 'n', 'x' }, '<C-w>t', '<C-w>v<c-]>', { desc = "GoTo tag in VSplit" });
keymap({ 'n', 'x' }, '<C-w>T', '<C-w><c-]>', { desc = "GoTo tag in Split" });


keymap({ 'n' }, '<C-d>', '<C-d>zz', { desc = "Center the screen on down" });
keymap({ 'n' }, '<C-u>', '<C-u>zz', { desc = "Center the screen on up" });
keymap({ 'n' }, 'n', 'nzzzv', { desc = "Center the screen on next" });
keymap({ 'n' }, 'N', 'Nzzzv', { desc = "Center the screen on Next" });

-- Some custom text-objects
-- Work on an entire line, either with or without the whitespace
keymap({ 'o', 'x' }, 'il', ':<C-u>norm! $v^<CR>',
  { silent = true, desc = "Choose entire line, not including whitespace start" });
keymap({ 'o', 'x' }, 'al', ':<C-u>norm! $v0<CR>',
  { silent = true, desc = "Choose entire line, including whitespace start" });

-- Work on the entire file
keymap({ 'o', 'x' }, 'aa', ':<C-u>norm! gg^vG$<CR>', { silent = true, desc = "Choose entire file" });

-- Based on [Jess Archer](https://www.youtube.com/watch?v=434tljD-5C8&t=339s)
keymap({ 'n', 'x' }, 'gf', ':edit<cfile><cr>', { desc = "Open a file, and create it if it does not exist" });

keymap({ 'n' }, '<leader>k', ':noh<cr>', { desc = "Remove the highlighting" })
keymap({ 'x' }, '<', '<gv', { desc = "Reindent, and then visually select again", noremap = true });
keymap({ 'x' }, '>', '>gv', { desc = "Reindent, and then visually select again", noremap = true });

keymap({ 'n' }, '<leader>x', ':!xdg-open %<cr><cr>', { desc = "Open file in default program" })
