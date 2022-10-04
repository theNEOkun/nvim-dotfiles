local tree = require("neo-tree");

local keymap = require('utils').map
local g = vim.g;
local api = vim.api;

local m = {}

g.loaded = 1;
g.loaded_netrwPlugin = 1;

local command = "NeoTreeShowInSplitToggle"

keymap('n', 'å', '<CMD>:' .. command .. '<CR>');
api.nvim_create_user_command('Ex', function() vim.cmd(command) end, { nargs = 0 })
api.nvim_create_user_command('Sex', function()
	vim.cmd('vsplit')
	vim.cmd(command)
end, { nargs = 0 })
api.nvim_create_user_command('Vex', function()
	vim.cmd('split')
	vim.cmd(command)
end, { nargs = 0 })

m.setup = tree.setup({
	enable_git_status = true,
	window = {
		mappings = {
			["<space>"] = {
				"open",
			}
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			visible = true,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules"
			},
		},
		hijack_netrw_behavior = "open_current",
		follow_current_file = true,
	},
});

return m
