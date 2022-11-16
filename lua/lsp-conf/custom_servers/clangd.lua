local M = {}

M.server_config = function(server, opts)
	local options = {
		server = opts,
	}
	require("clangd_extensions").setup(options);
	return nil;
end

return M
