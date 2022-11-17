local keymap = require('utils').map;
local u_cmd = require('utils').u_cmd;

vim.cmd("compiler ant");
local maven = "mvn";
vim.cmd("set makeprg=" .. maven);

keymap('n', '<leader>mr', '<cmd>:split<cr> :term<cr>i mvn compile exec:java<cr>')
keymap('n', '<leader>mt', '<cmd>:split<cr> :term<cr>i mvn test<cr>')

keymap({ 'n', 'x' }, '<leader>mp', function()
	local info = vim.fn.expand("%:h");
	info=info:gsub('/', '.');
	for _, each in ipairs({ 'src.test.java.', 'src.main.java.', 'src.test.', 'src.main.' }) do
		info=info:gsub(each, '')
	end
	vim.cmd(':normal ipackage '..info..';');
end)

u_cmd('Mt', ":!mvn -q test");


