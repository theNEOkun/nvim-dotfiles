local api = vim.api
local keymap = api.nvim_set_keymap
local buf_keymap = api.nvim_buf_set_keymap

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local key_opts = { noremap=true, silent=true }
keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', key_opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', key_opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', key_opts)
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', key_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', key_opts)
	buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', key_opts)
	buf_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', key_opts)
	----Open context-menu
	--buf_keymap(bufnr, 'n', '<C-s>', '<cmd>:RustHoverActions<cr>', key_opts)
	buf_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', key_opts)
	buf_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', key_opts)
	buf_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', key_opts)
	buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', key_opts)
	buf_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', key_opts)
	buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', key_opts)
	buf_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', key_opts)
end

local lsp_installer = require("nvim-lsp-installer")

--coq
vim.g.coq_settings = { auto_start = 'shut-up' }

local enhance_server_opts = {
	["sumneko_lua"] = function(opts)
		local root_files = {
			'.luarc.json',
			'.luacheckrc',
			'.stylua.toml',
			'selene.toml',
			'.git'
		}
		local util = require'lspconfig.util'
		local unpack = table.unpack or unpack
		opts.root_dir = 
		function(fname)
			return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
		end

	end,
}

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	local opts = require('coq').lsp_ensure_capabilities {
		on_attach = on_attach,
	}
	if server.name == "rust_analyzer" then
		require("rust-tools").setup({
			tools = {
				hover_actions = {
					auto_focus = true
				}
			},
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	elseif server.name == "clangd" then
		require("clangd_extensions").setup({
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	else
		if enhance_server_opts[server.name] then
			enhance_server_opts[server.name](opts)
		end

		-- This setup() function will take the provided server configuration and decorate it with the necessary properties
		-- before passing it onwards to lspconfig.
		-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		server:setup(opts)
	end
end)
