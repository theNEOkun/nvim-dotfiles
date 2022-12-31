local keymap = require('utils').map;
local dict = '<leader>w';
local set = vim.opt;

local basepath = vim.fn.stdpath('config') .. '/spell'
set.spellfile = basepath .. '/en.utf-8.add' .. ', ' .. basepath .. '/sv.utf-8.add';
set.spelllang:append({ 'en_gb', 'sv' });

keymap({ 'n', 'x' }, dict .. 'a', function() vim.cmd('normal! zg') end, { desc = "[W]ord [A]dd" });
keymap({ 'n', 'x' }, dict .. 'w', function() vim.cmd('normal! zuw') end, { desc = "[W]ord [W]rong add" });
keymap({ 'n', 'x' }, dict .. 'ua', function() vim.cmd('normal! zg') end, { desc = "[W]ord [U]ndo [A]dd" });
keymap({ 'n', 'x' }, dict .. 'uw', function() vim.cmd('normal! zuw') end, { desc = "[W]ord [U]ndo [W]rong" });
keymap({ 'n' }, dict .. 'r', function() vim.cmd('normal! z=') end, { desc = "[W]ord [R]eplace" });

keymap({ 'n' }, dict .. 'n', function() vim.cmd('normal! ]s') end, { desc = "[W]ord [N]ext fault" });
keymap({ 'n' }, dict .. 'p', function() vim.cmd('normal! [s') end, { desc = "[W]ord [P]revious fault" });
keymap({ 'n' }, dict .. 'bn', function() vim.cmd('normal! ]S') end, { desc = "[W]ord [B]ad [N]ext" });
keymap({ 'n' }, dict .. 'bp', function() vim.cmd('normal! [S') end, { desc = "[W]ord [B]ad [P]revous" });

