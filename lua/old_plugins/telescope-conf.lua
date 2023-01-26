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
        },
        pickers = {
          find_files = {
            theme = 'dropdown',
          },
          git_files = {
            theme = 'dropdown',
          }
        }
      });
      local builtin = require('telescope.builtin')
      local tstart = '<leader>f';
      --Telescope
      keymap('n', tstart .. 'k', builtin.keymaps, { desc = "[T]elescope [K]eymaps" })
      keymap('n', tstart .. 'f', builtin.find_files, { desc = "[T]elescope (All) [T]elescope" })
      keymap('n', tstart .. 'g', builtin.git_files, { desc = "[T]elescope (Stored in) [G]it" })
      keymap('n', tstart .. 's', builtin.live_grep, { desc = "[T]elescope [S]earch" })
      keymap('n', tstart .. 'b', builtin.buffers, { desc = "[T]elescope [B]uffers"  })
      keymap('n', tstart .. 'h', builtin.help_tags, { desc = "[T]elescope [H]elp-tags" })
    end
  }
}
