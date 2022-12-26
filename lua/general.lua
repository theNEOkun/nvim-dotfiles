local g = vim.g;
local set = vim.opt;

local unpack = table.unpack or unpack;

-- Set the leader-key to spacebar;
require('utils').map('n', '<space>', '<nop>');
g.mapleader = " ";

-- Use relative linenumbers;
set.number = true;
set.relativenumber = true;
set.signcolumn = "yes";

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
vim.opt.isfname:append("@-@");

set.colorcolumn = "80";

set.clipboard:prepend { "unnamed" };

g.wildmenu = true;
g.wildmode = { "list", "longest:full", "full" };
g.wildoptions = { "fuzzy" };
set.wildignore = "**/node_modules/*,*.obj,*.class,*/obj/*,tags,*/CMakeFiles/*,**/*.dex,**/build/*";
set.completeopt = 'menuone,noselect';

-- set.path:append { "**" };

set.list = true;
set.listchars:append({ trail = '.', tab = '> '});

set.confirm = true;
