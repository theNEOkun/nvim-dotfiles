local M = {}

local extension_path = os.getenv('HOME') .. '/library/vscode_lldb/extension'
local codelldb_path = extension_path .. '/adapter/codelldb'
local lidlldb_path = extension_path .. '/lldb/lib/liblldb.so'

M.server_config = function(server, opts)
	opts.cmd = { 'rust-analyzer' }
	local rust_opts = {
		tools = {
			hover_actions = {
				auto_focus = true
			}
		},
		dap = {
			adapter = require('rust-tools.dap').get_codelldb_adapter(
				'codelldb', lidlldb_path
			)
		},
		server = opts,
	}
	require('rust-tools').setup(rust_opts)
end

return M