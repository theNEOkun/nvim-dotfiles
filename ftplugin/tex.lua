local set = vim.opt;
local utils = require('utils');
local keymap = utils.map;

set.colorcolumn = "101";
set.textwidth = 100;
set.wrap = true;
set.spell = true;
set.fex="";

local start = '<leader>t';
keymap({ 'x', 'n' }, start .. 'l', ':lua require("tex").insert_link()<cr>');
keymap({ 'n' }, start .. 'l', ':lua require("tex").insert_link_on_word()<cr>');
keymap({ 'x' }, start .. 'h', ':lua require("tex").highlight()<cr>');
keymap({ 'x' }, start .. 'h', ':lua require("tex").italizise()<cr>');
