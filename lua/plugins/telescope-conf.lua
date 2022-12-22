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
      local tstart = '<leader>t';
      --Telescope
      keymap('n', tstart .. 'k', '<cmd>lua require("telescope.builtin").keymaps()<cr>', { desc = "[T]elescope [K]eymaps" })
      keymap('n', tstart .. 'f', builtin.find_files, { desc = "[T]elescope (All) [T]elescope" })
      keymap('n', tstart .. 'g', builtin.git_files, { desc = "[T]elescope (Stored in) [G]it" })
      keymap('n', tstart .. 's', '<cmd>Telescope live_grep<cr>', { desc = "[T]elescope [S]earch" })
      keymap('n', tstart .. 'b', '<cmd>Telescope buffers<cr>', { desc = "[T]elescope [B]uffers"  })
      keymap('n', tstart .. 'h', '<cmd>Telescope help_tags<cr>', { desc = "[T]elescope [H]elp-tags" })
    end
  }
}
