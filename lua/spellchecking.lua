local keymap = require('utils').map;
local dict = '<leader>w';
local set = vim.opt;

local basepath = vim.fn.stdpath('config') .. '/spell'
set.spellfile = basepath .. '/en.utf-8.add' .. ', ' .. basepath .. '/sv.utf-8.add';
set.spelllang:append({ 'en_gb', 'sv' });

keymap({ 'n', 'x' }, dict .. 'a', 'zg', { desc = "[W]ord [A]dd" });
keymap({ 'n', 'x' }, dict .. 'w', 'zuw', { desc = "[W]ord [W]rong add" });
keymap({ 'n', 'x' }, dict .. 'ua', 'zg', { desc = "[W]ord [U]ndo [A]dd" });
keymap({ 'n', 'x' }, dict .. 'uw', 'zuw', { desc = "[W]ord [U]ndo [W]rong" });
keymap({ 'n' }, dict .. 'r', 'z=', { desc = "[W]ord [R]eplace" });

keymap({ 'n' }, dict .. 'n', ']s', { desc = "[W]ord [N]ext fault" });
keymap({ 'n' }, dict .. 'p', '[s', { desc = "[W]ord [P]revious fault" });
keymap({ 'n' }, dict .. 'bn', ']S', { desc = "[W]ord [B]ad [N]ext" });
keymap({ 'n' }, dict .. 'bp', '[S', { desc = "[W]ord [B]ad [P]revous" });

