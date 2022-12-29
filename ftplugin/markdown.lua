local set = vim.opt;
local keymap = require('utils').map;

local basepath = vim.fn.stdpath('config') .. '/spell'
set.spellfile = basepath .. '/en.utf-8.add' .. ', ' .. basepath .. '/sv.utf-8.add';
set.colorcolumn = "101";
set.textwidth = 100;
set.wrap = true;
set.spell = true;
set.spelllang:append({ 'en_gb', 'sv' });

local dict = '<leader>w';
keymap({ 'n', 'x' }, dict .. 'a', function() vim.cmd('normal! zg') end)
keymap({ 'n', 'x' }, dict .. 'u', function() vim.cmd('normal! zuw') end)
