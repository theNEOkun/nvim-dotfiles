local g = vim.g
local set = vim.opt

local unpack = table.unpack or unpack;

set.number = true
set.relativenumber = true;

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

--Minimap
-- g.minimap_width = 5
-- g.minimap_auto_start = 1
-- g.minimap_auto_start_win_enter = 1

require('utils').map('n', '<space>', '<nop>')
g.mapleader = " "

set.list = true;

set.listchars = { space = '⋅', eol = '¬', extends = '»', precedes = '«', nbsp = '⣿', trail = '_', tab = '> ',
	unpack(set.listchars) };

-- vim.api.nvim_command("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
