local M = {}

local utils = require('utils')
local keymap = utils.map
local buf_keymap = utils.buf_map

local start = '<leader>c'

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', start .. 'qf', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "[C]ode [Q]uick [F]loat" })
keymap('n', start .. 'qp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = "[C]ode [Q]uick [P]revious" })
keymap('n', start .. 'qn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = "[C]ode [Q]uick [N]ext" })
keymap('n', start .. 'ql', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = "[C]ode [Q]uick [L]oc_list" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_keymap(bufnr, 'n', start .. 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = "[C]ode Open the hover-menu" })
  buf_keymap(bufnr, 'n', start .. 'i', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Go to [Code] [I]mplementation" })
  buf_keymap(bufnr, 'n', start .. 'r', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "Go to [C]ode [R]eferences" })
  buf_keymap(bufnr, 'n', start .. 's', require('telescope.builtin').lsp_references, { desc = "[C]ode [S]how references" });
  buf_keymap(bufnr, 'n', start .. 'd', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    { desc = "Go to [C]ode [Definition]" })
  buf_keymap(bufnr, 'n', start .. 'D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    { desc = "Go to [C]ode Type [D]efinition" })
  buf_keymap(bufnr, 'n', start .. 'a', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    { desc = "Selects a [C]ode [A]ction available" })
  buf_keymap(bufnr, 'n', start .. 'f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { desc = "[C]ode [F]ormat" })

  --Open context-menu
  if client.name == "rust_analyzer" then
    buf_keymap(bufnr, 'n', '<C-s>', '<cmd>:RustHoverActions<cr>', { desc = "Opens the Hover-Actions" })
  else
    buf_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Opens the hover-action menu" })
  end
end

return M
