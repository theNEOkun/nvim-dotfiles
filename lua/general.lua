local g = vim.g
local set = vim.opt

vim.cmd('colorscheme catppuccin')

set.number = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smartindent = true
set.wrap = false
set.termguicolors = true
set.timeoutlen = 500

set.clipboard:prepend {"unnamed"}

set.mouse = "a"

g.wildmenu = true
g.wildmode = {"list, full"}

--Minimap
g.minimap_width = 5
g.minimap_auto_start = 1
g.minimap_auto_start_win_enter = 1

vim.api.nvim_set_keymap('n', '<space>', '<nop>', {})
g.mapleader = " "
