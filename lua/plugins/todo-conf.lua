local M =
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

    local start = '<leader>t';

    keymap("n", start .. "n", function()
      todo.jump_next();
    end, { desc = "[T]odo [N]ext" })

    keymap("n", start .. "p", function()
      todo.jump_prev();
    end, { desc = "[T]odo [P]revious" })

    keymap({ 'n' }, start .. 'l', '<cmd>:TodoQuickFix<cr>', { desc = "[T]odo [L]ist" });

    return m;

  end
}

return { M }
