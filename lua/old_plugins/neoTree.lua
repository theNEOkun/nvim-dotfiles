return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      {
        'miversen33/netman.nvim',
        branch = 'v1.1',
      },
    },
    config = function()
      local tree = require("neo-tree");

      local keymap = require('utils').map
      local cmd = require('utils').u_cmd;
      local g = vim.g;

      g.loaded = 1;
      g.loaded_netrwPlugin = 1;

      local command = "NeoTreeShowInSplitToggle"

      keymap('n', '<A-->', '<CMD>:' .. command .. '<CR>');
      -- Just explore
      cmd('Ex', function() vim.cmd(command) end)
      -- Horisontal explore
      cmd('Sex', function()
        vim.cmd('split')
        vim.cmd(command)
      end)
      -- Vertical Explore
      cmd('Vex', function()
        vim.cmd('vsplit')
        vim.cmd(command)
      end)

      tree.setup({
        sources = {
          "filesystem", -- Neotree filesystem source
          -- "netman.ui.neo-tree", -- The one you really care about 😉
        },
        enable_git_status = true,
        window = {
          position = "current",
          mappings = {
            ["<space>"] = {
              "open",
            }
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            visible = true,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
          },
          netrw_hijack_behavior = "open_default",
        },
        event_handlers = {
          {
            event = "after_render",
            handler = function(_)
              vim.cmd("set number");
              vim.cmd("set relativenumber");
            end
          }
        }
      });
    end
  },
}
