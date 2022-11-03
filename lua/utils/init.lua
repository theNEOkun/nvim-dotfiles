--https://gitlab.com/CraftedCart/dotfiles/-/blob/00ec7b1bb31be2871f0dacdda5ea6de04e59b067/.config/nvim/lua/c/keybind.lua

local M = {}

M.keybind = {}

local keymap = vim.keymap.set

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

-- Creates an autocommand "easier"
-- @param actions are the actions to do the command on
-- @param aupattern is the pattern to listen formd
-- @param aucommand is the command to do
M.autocmd = function(actions, aupattern, aucommand)
	local augroup = vim.api.nvim_create_augroup(actions, { clear = true });
	vim.api.nvim_create_autocmd(actions, {
		pattern = aupattern, group = augroup,
		command = aucommand,
	});
end

return M
