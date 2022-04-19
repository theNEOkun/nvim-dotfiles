local M = {}

M.server_config = function(server, opts)
	require("rust-tools").setup({
		tools = {
			hover_actions = {
				auto_focus = true
			}
		},
		server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
	})
	server:attach_buffers()
end

return M
