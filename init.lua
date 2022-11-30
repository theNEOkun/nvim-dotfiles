if vim.g.vscode then
	require('general')
	require('keymaps')
	require('skeletons')
else
	require('plugins')
	require('general')
	require('plugin-keymaps')
	require('keymaps')
	require('skeletons')
	require('autocommands')
end
