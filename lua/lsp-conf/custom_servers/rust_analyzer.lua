local M = {}

local extension = os.getenv('HOME') .. '/library/vscode-lldb/extension/'
local openlldb = extension .. "/adapter/openlldb"
local lib_lldb = extension .. "/lldb/lib/liblldb.so"

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
