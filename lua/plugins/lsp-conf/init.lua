
local M = {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'joechrisellis/lsp-format-modifications.nvim' },

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

    -- --Telescope
    -- { 'nvim-telescope/telescope.nvim' },
    --

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
    lsp.setup_servers({
      'rust_analyzer',
      'hls',
      -- 'clangd',
      force = true,
    });

    lsp.skip_server_setup({
      'rust_analyzer',
      'hls',
      -- 'jdtls',
    });

    local cmp = require('cmp');
    local cmp_select = { behavior = cmp.SelectBehavior.Select };
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.abort(),
      ['<C-e>'] = cmp.mapping.confirm({ select = true }),
    });

    local ts_utils = require('nvim-treesitter.ts_utils');
    lsp.setup_nvim_cmp({
      mapping = cmp_mappings,
      sources = {
        {
          name = 'nvim_lsp',
          entry_filter = function(entry, context)
            if entry == nil then return true; end
            local kind = entry:get_kind();
            if ts_utils.get_node_at_cursor() == nil then return true; end
            local node = ts_utils.get_node_at_cursor():type();
            if node == nil then return true; end
            if node == "arguments" then
              if kind == 6 then
                return true;
              end
              return false;
            end
            return true;
          end
        }
      }
    });

    local list = require('plugins.lsp-conf.servers')

    for client, opts in pairs(list) do
      vim.pretty_print(opts.server_config());
      lsp.configure(client, opts.server_config());
    end

    lsp.on_attach(function(client, bufnr)
      if list[client.name] then
        list[client.name].on_attach(client, bufnr);
      else
        require( 'plugins.lsp-conf.helper' ).on_attach(client, bufnr);
      end
    end)

    -- Add in null-ls as well there
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
      },
      on_attach = require( 'plugins.lsp-conf.helper' ).on_attach
    });

    lsp.setup();

    vim.diagnostic.config({
      virtual_text = true,
    });
  end,
}

return { M };
