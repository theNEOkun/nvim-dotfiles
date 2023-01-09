local autogroup = require('utils').autogroup;
local autocmd = require('utils').autocmd;

autocmd('InsertEnter', '*', ':set norelativenumber')
autocmd('InsertLeave', '*', ':set relativenumber')
