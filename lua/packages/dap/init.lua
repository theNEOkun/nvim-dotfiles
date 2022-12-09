return {
  {
    'rcarriga/nvim-dap-ui',
    requires = {
      {
        'mfussenegger/nvim-dap'
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        requires = {
          'williamboman/mason.nvim',
        }
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        function()
          M = require('nvim-dap-virtual-text').setup();
          require('packages.dap.init');
          return M;
        end,
        requires = 'mfussenegger/nvim-dap'
      },
    },
    function()
      local dap = require('dap')
      local nvim_dap = require('mason-nvim-dap');
      nvim_dap.setup();
      nvim_dap.setup_handles({
        function(source_name)
          -- all sources with no handler get passed here
          -- Keep original functionality of `automatic_setup = true`
          require('mason-nvim-dap.automatic_setup')(source_name)
        end
      });
      require('packages.dap.keymaps')
      require('packages.dap.adapters.lua_adapt')
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
