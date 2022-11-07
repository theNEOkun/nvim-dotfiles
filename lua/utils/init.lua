--https://gitlab.com/CraftedCart/dotfiles/-/blob/00ec7b1bb31be2871f0dacdda5ea6de04e59b067/.config/nvim/lua/c/keybind.lua

local M = {}

M.keybind = {}

local keymap = vim.keymap.set
local api = vim.api

--Used to map to a keybinding
--@param mode is the mode for the keybinding
--@param keys are the keys to be pressed
--@param command is the command to execute
--@param opts are the options to use
M.map = function(mode, keys, command, opts)
	local options = { noremap = false, silent = true }
	if opts then options = vim.tbl_extend("force", options, opts) end
	keymap(mode, keys, command, options)
end

--Used to map to a keybinding
--@param bufnr is the buffer to attach to
--@param mode is the mode for the keybinding
--@param keys are the keys to be pressed
--@param command is the command to execute
--@param opts are the options to use
M.buf_map = function(bufnr, mode, keys, command, opts)
	local options = { noremap = true, silent = false, buffer = bufnr }
	if opts then options = vim.tbl_extend("force", options, opts) end
	keymap(mode, keys, command, options)
end

M.autogroup = function(group_name)
	return api.nvim_create_augroup(group_name, { clear = false });
end

-- Creates an autocommand "easier"
-- @param actions are the actions to do the command on
-- @param aupattern is the pattern to listen formd
-- @param aucommand is the command to do
M.autocmd = function(actions, aupattern, aucommand, augroup)
	api.nvim_create_autocmd(actions, {
		pattern = aupattern,
		group = augroup,
		command = aucommand,
	});
end

-- Creates a user-command
-- @param command is the command to listen for
-- @param func is the function to execute
-- @param args are the args to give
M.u_cmd = function(command, func, args)
	local l_args = { nargs = 0 };
	if args then l_args = vim.tbl_extend("force", l_args, args) end
	api.nvim_create_user_command(
		command,
		func,
		l_args
	);
end

return M
