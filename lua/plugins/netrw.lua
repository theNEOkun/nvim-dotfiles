local g = vim.g;
-- local M = {
--   'stevearc/oil.nvim',
--   config = function()
--     local oil = require 'oil';
--
--
--     local command = "lua require('oil').open(vim.fn.getcwd())"
--
--     local cmd = require('utils').u_cmd;
--     -- Just explore
--     cmd('Ex', function() vim.cmd(command) end)
--     -- Horisontal explore
--     cmd('Sex', function()
--       vim.cmd('split')
--       vim.cmd(command)
--     end)
--     -- Vertical Explore
--     cmd('Vex', function()
--       vim.cmd('vsplit')
--       vim.cmd(command)
--     end)
--
--     local options = {
--       columns = {
--         "icon",
--         -- "permissions",
--         -- "size",
--         -- "mtime",
--       },
--       win_options = {
--         signcolumn = "yes",
--       },
--       view_options = {
--         -- Show files and directories that start with "."
--         show_hidden = false,
--       },
--     }
--
--     g.loaded_netrw = 1
--     g.loaded_netrwPlugin = 1
--     oil.setup(options);
--   end
-- }

g.netrw_banner = 0;
g.netrw_hide = 0;
g.netrw_keepdir= 0;
g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro';

local M = {
    'prichrd/netrw.nvim',
    config = function()
      require 'netrw'.setup({ })
    end,
}

return { M };
