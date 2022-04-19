local M = {}

local keymap = vim.api.nvim_set_keymap

M.map = function(mode, keys, command, opts)
	local options = { noremap=false, silent=true}
	if opts then options = vim.tbl_extend("force", options, opts) end
	keymap(mode, keys, command, options)
end

return M
