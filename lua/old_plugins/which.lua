return {
  {
    'folke/which-key.nvim',
    config = function()
      local which = require('which-key');
      which.setup({
        window = {
          border = "single",
          position = "bottom",
          margin = { 0, 1, 0, 0 }
        },
      });
    end
  }
}
