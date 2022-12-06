local g = vim.g;

g.netrw_banner = 0;
-- g.netrw_liststyle = 3;
g.netrw_hide = 0;

local m = {
    'prichrd/netrw.nvim',
    deps = {
      -- {
      --   'tpope/vim-vinegar'
      -- },
    },
    function()
      require 'netrw'.setup {
      }
    end,
}

return { m };
