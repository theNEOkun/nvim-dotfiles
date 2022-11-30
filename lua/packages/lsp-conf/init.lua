return {
  {
'neovim/nvim-lspconfig',
  requires = {
    { 'williamboman/mason.nvim' },

    { 'williamboman/mason-lspconfig.nvim' },
    --Autocomplete
    'ms-jpq/coq_nvim',
    requires = {
      'ms-jpq/coq.artifacts',
      'ms-jpq/coq.thirdparty',
      function() require('coq_3p') {
          { src = 'dap' },
          { src = "nvimlua", short_name = "nLUA", conf_only = true },
        }
      end
    },
  },
  function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    local lsp_installer = require("mason-lspconfig")

    local list = require('packages.lsp-conf.custom_servers')

    --coq
    vim.g.coq_settings = { auto_start = 'shut-up' }

    -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
    -- or if the server is already installed).
    local func = function()
      for _, server in pairs(lsp_installer.get_installed_servers()) do
        local opts = require('coq').lsp_ensure_capabilities {
          on_attach = require('packages.lsp-conf.helper').on_attach,
        }
        if list[server] then
          local curr_server = list[server]
          opts = curr_server.server_config(server, opts)
        end

        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        if opts then
          require('lspconfig')[server].setup(opts)
        end
      end
    end

    func();
  end,

  }};
