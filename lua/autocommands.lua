local autogroup = require('utils').autogroup;
local autocmd = require('utils').autocmd;

autocmd('InsertEnter', '*', ':set norelativenumber')
autocmd('InsertLeave', '*', ':set relativenumber')

-- Try to discover ron-files
local ft = require('utils').autogroup("filetypes");
require('utils').autocmd({'BufRead', 'BufNewFile'}, '*.ron', 'set filetype=ron', ft);
