local nvim_tree_events = require('nvim-tree.events')
local nvim_tree = require('nvim-tree');

nvim_tree.setup({
	git = {
		ignore = false,
	},
	reload_on_bufenter = true,
	hijack_netrw = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	view = {
		relativenumber = true,
		--mappings = {
		--	list = {
		--		{ key = "<CR>", action = "edit_in_place" }
		--	}
		--}
	}
})
