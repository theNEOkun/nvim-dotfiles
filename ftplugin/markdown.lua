local set = vim.opt;

local basepath = vim.fn.stdpath('config') .. '/spell'
set.spellfile = basepath .. '/en.utf-8.add' .. ', ' .. basepath .. '/sv.utf-8.add';
set.colorcolumn = "101";
set.textwidth = 100;
set.wrap = true;
set.spell = true;
set.spelllang:append({ 'en_gb', 'sv' });
