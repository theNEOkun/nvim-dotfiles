local M = {}

local utils = require('utils')
local keymap = utils.map
local buf_keymap = utils.buf_map

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
	buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	buf_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	buf_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	buf_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	buf_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	buf_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

	--Open context-menu
	if client.name == "rust_analyzer" then
		buf_keymap(bufnr, 'n', '<C-s>', '<cmd>:RustHoverActions<cr>')
	else
		buf_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	end
end

return M
