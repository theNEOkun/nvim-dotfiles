--https://github.com/seblj/dotfiles/blob/master/nvim/lua/config/lspconfig/ltex.lua
--https://github.com/tiagovla/.dotfiles/blob/0f664e30def1e460dd04fc8276f0d12f1ee2e88b/neovim/.config/nvim/lua/plugins/config/lsp/custom_servers/ltex.lua

local M = {}

M.file = function(lang)
	return {
		dictionary = vim.fn.stdpath('config') .. '/spell/'..lang..'.utf-8.add',
		disabledRules = vim.fn.stdpath('config') .. '/spell/'..lang..'/disable.txt',
		hiddenFalsePositives = vim.fn.stdpath('config') .. '/spell/'..lang..'/false.txt',
	}
end

local file_exists = function(file)
	local f = io.open(file, 'rb')
	if f then
		f:close()
	end
	return f ~= nil
end

M.lines_from = function(file)
	if not file_exists(file) then
		return {}
	end
	local lines = {}
	for line in io.lines(file) do
		table.insert(lines, line)
	end
	return lines
end

local get_client_by_name = function(name)
	local buf_clients = vim.lsp.get_active_clients()
	for _, client in ipairs(buf_clients) do
		if client.name == name then
			return client
		end
	end
	return nil
end

local update_config = function(lang, configtype, client)
	if client then
		if client.config.settings.ltex[configtype] then
			client.config.settings.ltex[configtype] = {
				[lang] = M.lines_from(M.file('en')[configtype]),
			}
			return client.notify('workspace/didChangeConfiguration', client.config.settings)
		else
			return vim.notify('Error when reading dictionary config, check it')
		end
	else
		return nil
	end
end

local add_to_file = function(configtype, lang, file, value)
	local dict = M.lines_from(file)
	for _, v in ipairs(dict) do
		if v == value then
			return nil
		end
	end
	file = io.open(file, 'a+')
	if file then
		file:write(value .. '\n')
		file:close()
	else
		return vim.notify(string.format('Failed insert %s', value))
	end
	return update_config(lang, configtype, get_client_by_name('ltex'))
end

local do_command = function(arg, configtype)
	for lang, words in pairs(arg) do
		for _, word in ipairs(words) do
			add_to_file(configtype, lang, M.file('en')[configtype], word)
		end
	end
end

local orig_execute_command = vim.lsp.buf.execute_command
vim.lsp.buf.execute_command = function(command)
	local arg = command.arguments[1]
	if command.command == '_ltex.addToDictionary' then
		do_command(arg.words, 'dictionary')
	elseif command.command == '_ltex.disableRules' then
		do_command(arg.ruleIds, 'disabledRules')
	elseif command.command == '_ltex.hideFalsePositives' then
		do_command(arg.falsePositives, 'hiddenFalsePositives')
	else
		orig_execute_command(command)
	end
end

M.on_attach = function(client, bufnr)
	require('plugins.lsp-conf.helper').on_attach(client, bufnr)
	--require('config.lspconfig').make_config().on_attach(client)
	-- Set some config on attach to prevent reading from the
	-- files when the language server is not used
	update_config('en-US', 'dictionary', client)
	update_config('en-US', 'disabledRules', client)
	update_config('en-US', 'hiddenFalsePositives', client)
	local buf_map = require('utils').buf_map
	buf_map(bufnr, 'n', 'zuw', function()
		vim.cmd('normal! zuw')
		update_config('en-US', 'dictionary')
	end)
	buf_map(bufnr, 'n', 'zg', function()
		vim.cmd('normal! zg')
		update_config('en-US', 'dictionary')
	end)
	-- TODO: Add some commands to remove the entry
	-- under the cursor from both disable and false
end

M.server_config = function()
  local opts = {};
	opts.settings = {
		ltex = {
			dictionary = {},
			disabledRules = {},
			hiddenFalsePositives = {}
		}
	}
	return opts
end

return M
