local tree = require("neo-tree");

local keymap = require('utils').map
local cmd = require('utils').u_cmd;
local g = vim.g;
local api = vim.api;

local m = {}

g.loaded = 1;
g.loaded_netrwPlugin = 1;

local command = "NeoTreeShowInSplitToggle"

keymap('n', '<A-->', '<CMD>:' .. command .. '<CR>');
cmd('Ex', function() vim.cmd(command) end)
cmd('Sex', function()
	vim.cmd('vsplit')
	vim.cmd(command)
end)
cmd('Vex', function()
	vim.cmd('split')
	vim.cmd(command)
end)

m.setup = tree.setup({
	enable_git_status = true,
	window = {
		position = "current",
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
		netrw_hijack_behavior = "open_default",
	},
	event_handlers = {
		{
			event = "after_render",
			handler = function(_)
				vim.cmd("set number");
				vim.cmd("set relativenumber");
			end
		}
	}
});

return m
