return {
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      {
        'folke/trouble.nvim',
        function()
          require("trouble").setup()
        end,
      }
    },
    function()
      local telescope = require("telescope");
      local keymap = require("utils").map;

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
        }
      });

      keymap({ 'n', 'i' }, '<leader>tt', function()
        require("trouble.providers.telescope").open_with_trouble();
      end);
      keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>')
    end
  }
}
