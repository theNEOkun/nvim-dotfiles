--https://gitlab.com/CraftedCart/dotfiles/-/blob/00ec7b1bb31be2871f0dacdda5ea6de04e59b067/.config/nvim/lua/c/keybind.lua

local M = {}

M.keybind = {}

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local bind_function = function(mode, keys, func)
  local func_name = "bind_" .. mode .. "_" .. keys

  local func_name_escaped = func_name
  -- Escape Lua things
  func_name_escaped = func_name_escaped:gsub("'", "\\'")
  func_name_escaped = func_name_escaped:gsub('"', '\\"')
  func_name_escaped = func_name_escaped:gsub("\\[", "\\[")
  func_name_escaped = func_name_escaped:gsub("\\]", "\\]")

  -- Escape VimScript things
  -- We only escape `<` - I couldn't be bothered to deal with how <lt>/<gt> have angle brackets in themselves
  -- And this works well-enough anyways
  func_name_escaped = func_name_escaped:gsub("<", "<lt>")

  M.keybind[func_name] = func

  local lua_command = ":lua require('utils').keybind['" .. func_name_escaped .. "']()<CR>"

  return lua_command
end

--Used to map to a keybinding
--@param mode is the mode for the keybinding
--@param keys are the keys to be pressed
--@param command is the command to execute
--@param opts are the options to use
M.map = function(mode, keys, command, opts)
	local options = { noremap=false, silent=true}
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
	local options = { noremap = true, silent = false }
	if opts then options = vim.tbl_extend("force", options, opts) end
	buf_keymap(bufnr, mode, keys, command, options)
end

--Used to map to a keybinding
--@param bufnr is the buffer to attach to
--@param mode is the mode for the keybinding
--@param keys are the keys to be pressed
--@param command is a function to attach to the buffer
--@param opts are the options to use
M.buf_map_func = function(bufnr, mode, keys, command, opts)
	local options = { noremap = true, silent = false }
	if opts then options = vim.tbl_extend("force", options, opts) end
	command = bind_function(mode, keys, command)
	buf_keymap(bufnr, mode, keys, command, options)
end

return M
