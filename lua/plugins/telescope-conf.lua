return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local telescope = require("telescope");
      local keymap = require("utils").map;

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
        }
      });
      local builtin = require('telescope.builtin')
      local tstart = '<leader>f';
      --Telescope
      keymap('n', tstart .. 'k', '<cmd>lua require("telescope.builtin").keymaps()<cr>', { desc = "Show all keymaps" })
      keymap('n', tstart .. 'f', builtin.find_files, { desc = "Show ALL files" })
      keymap('n', tstart .. 'g', builtin.git_files, { desc = "Show all git-files" })
      keymap('n', tstart .. 's', '<cmd>Telescope live_grep<cr>', { desc = "Grep all files" })
      keymap('n', tstart .. 'b', '<cmd>Telescope buffers<cr>', { desc = "Show all buffers"  })
      keymap('n', tstart .. 'h', '<cmd>Telescope help_tags<cr>', { desc = "Show all help-tags" })
    end
  }
}
