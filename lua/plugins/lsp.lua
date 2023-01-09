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
    { 'jose-elias-alvarez/null-ls.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
  },
  config = function()
    local lsp = require('lsp-zero');

    local null_ls = require("null-ls");
    lsp.preset('recommended');

    lsp.ensure_installed({
      'tsserver',
      'sumneko_lua',
      'jdtls',
    });

    -- This is installed on the computer already so...
    lsp.setup_servers({
      'clangd',
      'rust_analyzer',
      force = true,
    })

    local cmp = require('cmp');
    local cmp_select = { behavior = cmp.SelectBehavior.Select };
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping.abort(),
      ["<C-Space>"] = cmp.mapping.complete(),
    });

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    });

    local list = require('plugins.lsp-conf.custom_servers')

    for client, opts in pairs(list) do
      lsp.configure(client, opts.server_config());
    end

    lsp.on_attach(function(client, bufnr)
      if list[client.name] then
        list[client.name].on_attach(client, bufnr);
      else
        require('plugins.lsp-conf.helper').on_attach(client, bufnr);
      end
    end)

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
      },
      on_attach = require('plugin.lsp-conf.helper').on_attach
    });

    lsp.setup({

    });

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}

return { M };
