local telescope = require("telescope");
local keymap = require("utils").map;

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	}
});

keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>')
