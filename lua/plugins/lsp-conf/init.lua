-- Function that handles the creation of keymaps
-- @return an object with an on_attach
local function keymaps()
  local M = {}

  local utils = require('utils');
  local keymap = utils.map
  local buf_keymap = utils.buf_map

  local start = '<leader>c'

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  keymap('n', start .. 'qf', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "[C]ode [Q]uick [F]loat" });
  keymap('n', start .. 'qp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = "[C]ode [Q]uick [P]revious" });
  keymap('n', start .. 'qn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = "[C]ode [Q]uick [N]ext" });
  keymap('n', start .. 'ql', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = "[C]ode [Q]uick [L]oc_list" });

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  M.on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_keymap(bufnr, 'n', start .. 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = "[C]ode Open the hover-menu" });
    buf_keymap(bufnr, 'n', start .. 's', require('telescope.builtin').lsp_references,
      { desc = "[C]ode [S]how references" });
    buf_keymap(bufnr, 'n', start .. 'a', '<cmd>lua vim.lsp.buf.code_action()<CR>',
      { desc = "Selects a [C]ode [A]ction available" });
    buf_keymap(bufnr, 'n', start .. 'f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { desc = "[C]ode [F]ormat" });

    buf_keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "[G]o to Code [I]mplementation" });
    buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "[G]o to Code [R]eferences" });
    buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
      { desc = "[G]o to Code [Definition]" });
    buf_keymap(bufnr, 'n', 'gVd', ':vsp | lua vim.lsp.buf.type_definition()<cr>',
      { desc = "[G]o to Code [D]efinition in [V]ertical split" });
    buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
      { desc = "[G]o to Code Type [D]efinition" });

    --Open context-menu
    if client.name == "rust_analyzer" then
      buf_keymap(bufnr, 'n', start .. 'h', '<cmd>:RustHoverActions<cr>', { desc = "[C]ode [H]over-action" });
    else
      buf_keymap(bufnr, 'n', start .. 'h', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
        { desc = "[C]ode [H]over-action" });
    end
  end

  return M
end

local M = {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    { 'nvim-telescope/telescope.nvim' },

    -- Autopairs
    { 'windwp/nvim-autopairs' },

    -- Null LS for more capabilities
    { 'jose-elias-alvarez/null-ls.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
  },
  config = function()
    local lsp = require('lsp-zero');

    local null_ls = require("null-ls");
    lsp.preset('recommended');

    -- This is installed on the computer already so...
    -- lsp.setup_servers({
    --   'rust_analyzer',
    --   force = true,
    -- })

    local cmp = require('cmp');
    local cmp_select = { behavior = cmp.SelectBehavior.Select };
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    });

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    });

    local list = require('plugins.lsp-conf.servers')

    for client, opts in pairs(list) do
      lsp.configure(client, opts.server_config());
    end

    lsp.on_attach(function(client, bufnr)
      if list[client.name] then
        list[client.name].on_attach(client, bufnr);
      else
        keymaps().on_attach(client, bufnr);
      end
    end)

    -- Add in null-ls as well there
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
      },
      on_attach = keymaps().on_attach
    });

    lsp.setup({

    });

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}

return { M };
