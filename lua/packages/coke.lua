return {
  {
    'noib3/nvim-cokeline',
    function()
      local line = require('cokeline');
      line.setup();

      local map = require'utils'.map;

      map('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)');
      map('n', '<Tab>', '<Plug>(cokeline-focus-next)');
      map('n', '<Leader>p', '<Plug>(cokeline-switch-prev)');
      map('n', '<Leader>n', '<Plug>(cokeline-switch-next)');
      map('n', 'cb', '<Plug>(cokeline-pick-focus)');
    end,
  }
}
