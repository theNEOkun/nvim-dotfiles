local g = vim.g;
local api = vim.api;
g.loaded = 1;
g.loaded_netrwPlugin = 1;

local nvim_tree = require('nvim-tree');
local keymap = require('utils').map

local m = {}

local function toggle_replace()
	local view = require "nvim-tree.view";
	if view.is_visible() then
		view.close()
	else
		require("nvim-tree").open_replacing_current_buffer()
	end
end

m.toggle_replace = toggle_replace;

--CHADTree
keymap('n', '<C-->', '<cmd>:lua require("nvimTree").toggle_replace()<CR>')
-- keymap('n', '<C-->', '<cmd>:NvimTreeToggle<CR>', key_opts)

api.nvim_create_user_command('Ex', toggle_replace, { nargs = 0 })
api.nvim_create_user_command('Sex', function()
	vim.cmd('vsplit')
	require("nvim-tree").open_replacing_current_buffer()
end, { nargs = 0 })
api.nvim_create_user_command('Vex', function()
	vim.cmd('split')
	require("nvim-tree").open_replacing_current_buffer()
end, { nargs = 0 })

nvim_tree.setup({
	git = {
		ignore = false,
	},
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	view = {
		relativenumber = true,
		number = true,
		mappings = {
			list = {
				{ key = "<CR>", action = "edit_in_place" }
			}
		}
	},
})

return m;
