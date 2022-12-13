local M = {}

local utils = require('utils')
local keymap = utils.map
local buf_keymap = utils.buf_map

local start = '<leader>c'

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', start, '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', start .. 'd', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap('n', start .. 'd', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('n', start .. 'q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_keymap(bufnr, 'n', start .. 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Open the hover-menu" })
  buf_keymap(bufnr, 'n', start .. 'i', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Go to Implementation" })
  buf_keymap(bufnr, 'n', start .. 'r', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "Go to References" })
  buf_keymap(bufnr, 'n', start .. 'd', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    { desc = "Go to the Type Definition" })
  buf_keymap(bufnr, 'n', start .. 'a', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    { desc = "Selects a code action available" })
  buf_keymap(bufnr, 'n', start .. 'f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { desc = "Formats the code" })

  --Open context-menu
  if client.name == "rust_analyzer" then
    buf_keymap(bufnr, 'n', '<C-s>', '<cmd>:RustHoverActions<cr>', { desc = "Opens the Hover-Actions" })
  else
    buf_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Opens the hover-action menu" })
  end
end

return M
