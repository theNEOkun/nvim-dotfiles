local m = {}

local keymap = require('utils').map
local keymap_func = require('utils').map_func

local key_opts = { noremap = true, silent = true }

local function toggle_replace()
	local view = require "nvim-tree.view";
	if view.is_visible() then
		view.close()
	else
		require("nvim-tree").open_replacing_current_buffer()
	end
end

m.toggle_replace = toggle_replace

--CHADTree
--keymap('n', '<F6>', '<cmd>:lua require("lua.plugin-keymaps").toggle_replace()<CR>', key_opts)
keymap('n', '<C-->', '<cmd>:NvimTreeToggle<CR>', key_opts)

--Tagbar
keymap('n', '<F8>', '<cmd>:TagbarToggle<CR>')

--Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

keymap('n', '<F10>a', '<cmd>:TestSuite<CR>');
keymap('n', '<F10>f', '<CMD>:TestFile<CR>');
keymap('n', '<F10>s', '<CMD>:TestNearest<CR>');

return m
