return {
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    function()
      local telescope = require("telescope");
      local keymap = require("utils").map;

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
        }
      });
      keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>')
    end
  }
}
