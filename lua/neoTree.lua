local tree = require("neo-tree");

local keymap = require('utils').map
local g = vim.g;

local m = {}

g.loaded = 1;
g.loaded_netrwPlugin = 1;

keymap('n', '<C-->', '<CMD>:Neotree<CR>');

m.setup = tree.setup({
	enable_git_status = true,
	default_component_configs = {
		git_status = {
			untracked = "",
			ignored   = "",
			unstaged  = "",
			staged    = "",
			conflict  = "",
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
	window = {
		position = "current",
	},
	toggle = true,
});

return m
