local M = {}

M.server_config = function(server, opts)
	require("clangd_extensions").setup({
		server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
	})
	server:attach_buffers()
end

return M
