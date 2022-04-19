local g = vim.g
local set = vim.opt


set.number = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smartindent = true
set.wrap = false
set.termguicolors = true
set.timeoutlen = 500
set.background = "dark"

set.clipboard:prepend {"unnamed"}

set.mouse = "a"

g.wildmenu = true
g.wildmode = {"list, full"}

--Minimap
g.minimap_width = 5
g.minimap_auto_start = 1
g.minimap_auto_start_win_enter = 1

require('utils').map('n', '<space>', '<nop>')
g.mapleader = " "

vim.cmd('colorscheme doom-one')
