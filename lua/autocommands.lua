local autogroup = require('utils').autogroup;
local autocmd = require('utils').autocmdf;

autocmd('InsertEnter', '*', function()
  vim.cmd(':set norelativenumber');
  vim.g.relnum = false;
end)
autocmd('InsertLeave', '*', function()
  vim.cmd(':set relativenumber');
  vim.g.relnum = true;
end)

-- Try to discover ron-files
local ft = autogroup("filetypes");
autocmd({ 'BufRead', 'BufNewFile' }, '*.ron', 'set filetype=ron', ft);
autocmd({ 'BufRead', 'BufNewFile' }, '*.quh', 'set filetype=quh', ft);
