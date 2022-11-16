local M = {}

M.server_config = function(server, opts)
	require("clangd_extensions").setup({
		server = opts,
	})
	return nil;
end

return M
