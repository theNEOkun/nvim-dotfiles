local M = {
  'ziglang/zig.vim',
  config = function ()
    vim.g.zig_fmt_autosave = false;
  end
}

return {M}
