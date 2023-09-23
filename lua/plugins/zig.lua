local M = {
  'ziglang/zig.vim',
  ft = { 'zig' },
  config = function ()
    vim.g.zig_fmt_autosave = false;
  end
}

return {M}
