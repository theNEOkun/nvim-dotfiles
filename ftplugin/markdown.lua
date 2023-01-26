local set = vim.opt;
local utils = require('utils');
local keymap = utils.map;

set.colorcolumn = "101";
set.textwidth = 100;
set.wrap = true;
set.spell = true;

local start = '<leader>m'
keymap({ 'x', 'n' }, start .. 'l', ':lua require("markdown").insert_link()<cr>');
keymap({ 'x' }, start .. 'h', ':lua require("markdown").highlight()<cr>');
