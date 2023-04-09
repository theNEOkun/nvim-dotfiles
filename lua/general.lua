local g = vim.g;
local set = vim.opt;

local unpack = table.unpack or unpack;

-- Set the leader-key to spacebar;
require('utils').map('n', '<space>', '<nop>');
g.mapleader = " ";

-- Use relative linenumbers;
set.number = true;
set.relativenumber = true;
g.relnum = true;
set.signcolumn = "yes";
-- Found [here](https://github.com/neovim/neovim/issues/21745#issuecomment-1501197311)
-- set.statuscolumn= "%=%{%v:virtnum?'':(&nu?(&rnu?(v:relnum?v:relnum:printf('%-'.max([3,len(line('$'))]).'S',v:lnum)):v:lnum):(&rnu?v:relnum:''))%}%s%C";
set.stc="%=%4{&nu?(&rnu&&v:relnum?v:relnum:v:lnum):''}%s%C";

set.colorcolumn = "80";

-- Use filetypes-plugin;
set.filetype = "on";

-- Use tabstop;
set.tabstop = 2;
set.softtabstop = 2;
set.shiftwidth = 2;
set.expandtab = true;

-- Smartly indent things
set.smartindent = true;
set.wrap = false;
set.termguicolors = true;
set.timeoutlen = 500;
set.background = "dark";
set.splitbelow = false;
set.splitright = true;

-- no hightligh
set.hlsearch = false;
-- incremental search
set.incsearch = true;

-- Mouse only in Normal and Visual
set.mouse = "nv";

set.scrolloff = 8;
set.isfname:append("@-@");

set.clipboard:prepend { "unnamed" };

g.wildmenu = true;
g.wildmode = { "list", "longest:full", "full" };
g.wildoptions = { "fuzzy" };
set.wildignore = "**/node_modules/*,tags";
set.completeopt = 'menuone,noselect';

-- set.path:append { "**" };

set.list = true;
set.listchars:append({ trail = '.', tab = '> ' });

set.confirm = true;
