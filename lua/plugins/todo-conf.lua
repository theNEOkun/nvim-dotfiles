return {
  {
    'folke/todo-comments.nvim',
    config = function()

      local todo = require("todo-comments");
      todo.setup();
      local keymap = require("utils").map;

      local m = {};

      m.setup = function(extra)
        return todo.setup(extra)
      end

      local start = '<leader>f';

      keymap("n", start .. "n", function()
        todo.jump_next();
      end, { desc = "[F]ix [N]ext" })

      keymap("n", start .. "p", function()
        todo.jump_prev();
      end, { desc = "[F]ix [P]revious" })

      keymap({ 'n' }, start .. 'l', '<cmd>:TodoQuickFix<cr>', { desc = "[F]ix [L]ist" });

      return m;

    end
  }
}
