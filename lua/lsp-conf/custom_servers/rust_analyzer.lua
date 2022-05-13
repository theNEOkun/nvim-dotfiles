local M = {}

local extension_path = os.getenv('HOME') .. '/library/vscode_lldb/extension'
local codelldb_path = extension_path .. '/adapter/codelldb'
local lidlldb_path = extension_path .. '/lldb/lib/liblldb.so'

M.server_config = function(server, opts)
	local rust_opts = {
		tools = {
			hover_actions = {
				auto_focus = true
			}
		},
		dap = {
			adapter = require('rust-tools.dap').get_codelldb_adapter(
			codelldb_path, lidlldb_path
			)
		},
		server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
	}
	require('rust-tools').setup(rust_opts)
	server:attach_buffers()
end

return M
