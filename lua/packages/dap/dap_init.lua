return {
  {
    'rcarriga/nvim-dap-ui',
    requires = {
      {
        'mfussenegger/nvim-dap'
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        function()
          M = require('nvim-dap-virtual-text').setup();
          require('packages.dap.dap_init');
          return M;
        end,
        requires = 'mfussenegger/nvim-dap'
      },
    },
    function()
      require('packages.dap.keymaps')

      local dap = require('dap')
      require('packages.dap.adapters.lua_adapt')

      local get_config_codelldb = function(path)
        return {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = path,
          cwd = vim.fn.getcwd(),
          stopOnEntry = true,
        }
      end

      -- dap.adapters.java = function(callback)
      --   -- FIXME:
      --   -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
      --   -- The response to the command must be the `port` used below
      --   local port = 13000;
      --   callback({
      --     type = 'server';
      --     host = '127.0.0.1';
      --     port = port;
      --   })
      -- end

      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'codelldb',
          args = { '--port', '${port}' },
        }
      }

      dap.configurations.cpp = {
        get_config_codelldb(function()
          return vim.fn.input('Executable name: ', vim.fn.getcwd() .. '/bin/', 'file')
        end)
      }

      dap.configurations.c = dap.configurations.cpp

      dap.configurations.rust = { get_config_codelldb(function() return vim.fn.input('Executable name: ',
        vim.fn.getcwd() .. '/target/debug/', 'file')
      end), }
    end
  }
};
