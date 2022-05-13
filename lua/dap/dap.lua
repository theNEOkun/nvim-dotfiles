require('dap.keymaps')

local dap = require('dap')
require('dap.adapters.codelldb')
require('dap.adapters.lldb')
require('dap.adapters.lua_adapt')

local get_config_codelldb = function(path)
	return {
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = path,
		cwd = vim.fn.getcwd(),
		stopOnEntry = true,
	}
end

local get_config_lldb = function(path)
	return {
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = path,
		cwd = vim.fn.getcwd(),
		stopOnEntry = true,
	}
end

dap.configurations.cpp = {get_config_lldb(function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end),}

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {get_config_lldb(function() return vim.fn.input('Executable name: ', vim.fn.getcwd()..'/target/debug/', 'file') end),}
