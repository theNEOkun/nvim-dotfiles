local keymap = require('utils').map

local key_opts = { noremap=true, silent=true }
--CHADTree
keymap('n', '<F6>', '<cmd>:NvimTreeToggle<cr>', key_opts)

--Tagbar
keymap('n', '<F8>', '<cmd>:TagbarToggle<CR>')

--Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

--vim.g.coq_settings.keymap = {
--	bigger_preview = "<c-i>"
--}
