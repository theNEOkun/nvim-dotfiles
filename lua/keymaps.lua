local key_opts = { noremap=true, silent=true }

local keymap = require('utils').map


--General

--Tabs
--Next
keymap('n', '<A-t>', '<cmd>:tabn<CR>')
--New
keymap('n', '<A-e>', '<cmd>:tabe<CR>')
--Close
keymap('n', '<A-q>', '<cmd>:tabc<CR>')

--Increment and Decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

--Copy visually selected to clipboard
keymap('x', '<C-c>', '"+y', {})

--Paste from clipboard
keymap('n', '<C-p>', '"+p', {})
keymap('x', '<C-p>', '"+p', {})

-- save
keymap('n', '<C-s>', ':wa<CR>')
keymap('i', '<C-s>', '<C-o>:wa<CR>')

--move text
keymap('n', '<C-j>', ':m .+1<CR>==')
keymap('n', '<C-k>', ':m .-2<CR>==')
keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv")
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv")

--CHADTree
keymap('n', '<F2>', '<cmd>:NvimTreeToggle<cr>', key_opts)

--Tagbar
keymap('n', '<F8>', '<cmd>:TagbarToggle<CR>')

--Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')


--UndoTree
keymap('n', '<F5>', ':UndotreeToggle<CR>')

vim.g.coq_settings.keymap = {
	bigger_preview = "<c-i>"
}
