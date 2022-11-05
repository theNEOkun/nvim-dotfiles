if vim.g.vscode then
	require('general')
	require('keymaps')
	require('skeletons')
else
	require('plugin-keymaps')
	require('plugins')
	require('general')
	require('keymaps')
	require('skeletons')
end
