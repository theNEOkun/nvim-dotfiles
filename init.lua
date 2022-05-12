if vim.g.vscode then
	require('general')
	require('keymaps')
else
	require('general')
	require('plugins')
	require('keymaps')
	require('plugin-keymaps')
end
