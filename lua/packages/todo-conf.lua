return {
  {
    'folke/todo-comments.nvim',
    function()

      local todo = require("todo-comments");
      local keymap = require("utils").map;

      local m = {};

      m.setup = function(extra)
        return todo.setup(extra)
      end

      keymap("n", "]t", function()
        todo.jump_next();
      end)

      keymap("n", "[t", function()
        todo.jump_prev();
      end)

      return m;

    end
  }
}
