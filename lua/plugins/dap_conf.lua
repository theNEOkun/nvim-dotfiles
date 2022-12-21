return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      {
        'mfussenegger/nvim-dap'
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
          'williamboman/mason.nvim',
        }
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          M = require('nvim-dap-virtual-text').setup();
          return M;
        end,
        dependencies = 'mfussenegger/nvim-dap'
      },
    },
    config = function()
      local dap = require('dap')
      local nvim_dap = require('mason-nvim-dap');
      nvim_dap.setup({
        automatic_setup = true,
      });
      nvim_dap.setup_handlers({
        function(source_name)
          -- all sources with no handler get passed here
          -- Keep original functionality of `automatic_setup = true`
          require('mason-nvim-dap.automatic_setup')(source_name)
        end,
        codelldb = function(source_name)
          require('mason-nvim-dap.automatic_setup')(source_name)
          dap.configurations.cpp = {
            {
              name = 'Launch debug',
              type = 'codelldb',
              request = 'launch',
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/', 'file')
              end,
              cwd = '${workspaceFolder}',
              stopOnEntry = false,
              args = {},
            }
          }
        end
      });
      require('plugins.dap.keymaps')
      require('plugins.dap.adapters.lua_adapt')
      --
      -- local get_config_codelldb = function(path)
      --   return {
      --     name = "Launch file",
      --     type = "codelldb",
      --     request = "launch",
      --     program = path,
      --     cwd = vim.fn.getcwd(),
      --     stopOnEntry = true,
      --   }
      -- end
      --
      -- dap.adapters.codelldb = {
      --   type = 'server',
      --   port = '${port}',
      --   executable = {
      --     command = 'codelldb',
      --     args = { '--port', '${port}' },
      --   }
      -- }
      --
      -- dap.configurations.cpp = {
      --   get_config_codelldb(function()
      --     return vim.fn.input('Executable name: ', vim.fn.getcwd() .. '/bin/', 'file')
      --   end)
      -- }
      --
      -- dap.configurations.c = dap.configurations.cpp
      --
      -- dap.configurations.rust = { get_config_codelldb(function() return vim.fn.input('Executable name: ',
      --     vim.fn.getcwd() .. '/target/debug/', 'file')
      -- end), }
    end
  }
};
