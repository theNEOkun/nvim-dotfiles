local set = vim.opt;
local utils = require('utils');
local keymap = utils.map;

vim.g.global_excepts = {
  "*.log",
  "*.bib",
}

require('ignore').rerun();

set.colorcolumn = "101";
set.textwidth = 100;
set.wrap = true;
set.spell = true;

local start = '<leader>t';
keymap({ 'x', 'n' }, start .. 'l', ':lua require("tex").insert_link()<cr>');
keymap({ 'n' }, start .. 'l', ':lua require("tex").insert_link_on_word()<cr>');
keymap({ 'x' }, start .. 'h', ':lua require("tex").highlight()<cr>');
keymap({ 'x' }, start .. 'i', ':lua require("tex").italisize()<cr>');
