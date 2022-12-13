return {
  {
    'folke/todo-comments.nvim',
    function()

      local todo = require("todo-comments");
      todo.setup();
      local keymap = require("utils").map;

      local m = {};

      m.setup = function(extra)
        return todo.setup(extra)
      end

      local start = '<leader>t';

      keymap("n", start .. "n", function()
        todo.jump_next();
      end)

      keymap("n", start .. "p", function()
        todo.jump_prev();
      end)

      keymap({ 'n' }, 'tt', '<cmd>:TodoQuickFix<cr>');

      return m;

    end
  }
}
