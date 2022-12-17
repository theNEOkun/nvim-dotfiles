local M = {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
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
  },
  function()
    local lsp = require('lsp-zero');
    local helper = require('packages.lsp-conf.helper');
    lsp.preset('recommended');

    lsp.ensure_installed({
      'tsserver',
      'sumneko_lua',
      'clangd',
      'jdtls',
      'rust_analyzer'
    });

    local cmp = require('cmp');
    local cmp_select = { behavior = cmp.SelectBehavior.Select };
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    });

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    });

    local list = require('packages.lsp-conf.custom_servers')

    for client, opts in pairs(list) do
      lsp.configure(client, opts.server_config());
    end

    lsp.on_attach(function(client, bufnr)
      if list[client] then
        list[client].on_attach(client, bufnr);
      else
        helper.on_attach(client, bufnr);
      end
    end)

    lsp.setup({

    });

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}

return { M };
