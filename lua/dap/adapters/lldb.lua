local dap = require('dap')

local lldb_path = '/usr/bin/lldb'

dap.adapters.lldb = {
	type = 'executable',
	command = lldb_path,
	name = 'lldb'
}
