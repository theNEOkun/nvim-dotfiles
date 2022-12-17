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
set.smartindent = true;
set.wrap = false;
set.termguicolors = true;
set.timeoutlen = 500;
set.background = "dark";
set.splitbelow = false;
set.splitright = true;
set.hlsearch = false;
set.incsearch = true;

set.mouse = "nv";

set.colorcolumn = "101";

set.clipboard:prepend { "unnamed" };

g.wildmenu = true;
g.wildmode = { "list", "longest:full", "full" };
g.wildoptions = { "fuzzy" };
vim.cmd(":set wildignore+=**/node_modules/*,*.obj,*.class,*/obj/*,tags,*/CMakeFiles/*,**/*.dex,**/build/*");

-- set.path:append { "**" };

set.list = true;
set.listchars:append({ trail = '.', tab = '> '});

set.confirm = true;
