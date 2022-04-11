local key_opts = { noremap=true, silent=true }
local no_remap_opt = { noremap=false, silent=true}

local keymap = vim.api.nvim_set_keymap


--General

--Increment and Decrement
keymap('n', '+', '<C-a>', no_remap_opt)
keymap('n', '-', '<C-x>', no_remap_opt)

--Copy visually selected to clipboard
keymap('x', '<C-c>', '"+y', {})

--Paste from clipboard
keymap('n', '<C-p>', '"+p', {})
keymap('x', '<C-p>', '"+p', {})

-- save
keymap('n', '<C-s>', ':wa<CR>', no_remap_opt)
keymap('i', '<C-s>', '<C-o>:wa<CR>', no_remap_opt)

--move text
keymap('n', '<C-j>', ':m .+1<CR>==', no_remap_opt)
keymap('n', '<C-k>', ':m .-2<CR>==', no_remap_opt)
keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi', no_remap_opt)
keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi', no_remap_opt)
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", no_remap_opt)
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", no_remap_opt)

--CHADTree
keymap('n', '<F2>', '<cmd>:NvimTreeToggle<cr>', key_opts)

--Tagbar
keymap('n', '<F8>', '<cmd>:TagbarToggle<CR>', no_remap_opt)

--Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', no_remap_opt)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', no_remap_opt)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', no_remap_opt)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', no_remap_opt)


--UndoTree
keymap('n', '<F5>', ':UndotreeToggle<CR>', no_remap_opt)

vim.g.coq_settings.keymap = {
	bigger_preview = "<c-i>"
}
