local M = {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.api.nvim_command, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    { 'joechrisellis/lsp-format-modifications.nvim' },


    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    { 'rafamadriz/friendly-snippets' },

    -- Autocompletion - other
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- Autopairs
    { 'windwp/nvim-autopairs' },
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    local list = require('plugins.lsp-conf.servers')

    lsp_zero.on_attach(function(client, bufnr)
      if list[client.name] then
        list[client.name].on_attach(client, bufnr);
      else
        require('plugins.lsp-conf.helper').on_attach(client, bufnr);
      end
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls'
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end
      }
    })

    local cmp = require('cmp');
    local cmp_select = { behavior = cmp.SelectBehavior.Select };
    local cmp_format = lsp_zero.cmp_format();
    local cmp_mappings = lsp_zero.defaults.cmp_mappings({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-o>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.abort(),
          ['<C-e>'] = cmp.mapping.confirm({ select = true; }),
    });

    local ts_utils = require('nvim-treesitter.ts_utils');

    cmp.setup({
      format = cmp_format,
      mapping = cmp_mappings,
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
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

    vim.diagnostic.config({
      virtual_text = true,
    });
  end
}

return { M };
