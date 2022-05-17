local lsp_installer = require("nvim-lsp-installer")
local list = require('lsp-conf.custom_servers')

--coq
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	local opts = require('coq').lsp_ensure_capabilities {
		on_attach = require('lsp-conf.helper').on_attach,
	}
	if list[server.name] then
		local curr_server = list[server.name]
		opts = curr_server.server_config(server, opts)
	end

	-- This setup() function will take the provided server configuration and decorate it with the necessary properties
	-- before passing it onwards to lspconfig.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	if opts then
		server:setup(opts)
	end
end)