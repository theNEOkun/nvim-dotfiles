local m = {
  url = "https://git.sr.ht/~p00f/clangd_extensions.nvim",
  ft = { 'c', 'cpp' },
  dependencies = {
    'VonHeikemen/lsp-zero.nvim',
  },
  config = function()
    local lsp = require 'lsp-zero';
    local opts = lsp.build_options('clangd', {});
    local options = {
      server = opts,
    }
    require("clangd_extensions").setup(options);
    return nil;
  end
}

return { m };
