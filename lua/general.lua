local g = vim.g;
local set = vim.opt

local unpack = table.unpack or unpack;

require('utils').map('n', '<space>', '<nop>')
g.mapleader = " "

set.number = true
set.relativenumber = true;
set.signcolumn = "yes";

set.filetype = "on";

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smartindent = true
set.wrap = false
set.termguicolors = true
set.timeoutlen = 500
set.background = "dark"

set.colorcolumn = "101"

set.clipboard:prepend { "unnamed" }

g.wildmenu = true
g.wildmode = { "list, full" }

set.path:append { "**" };

set.list = true;

require"dumbfox"
vim.cmd('colorscheme nightfox');
set.listchars = { space = '⋅', eol = '¬', extends = '»', precedes = '«', nbsp = '⣿', trail = '_', tab = '> ',
	unpack(set.listchars) };
