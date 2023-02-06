local M = {
  "MrcJkb/haskell-tools.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  ft = "haskell",
  config = function()
    local ht = require('haskell-tools')
    local helper = require('plugins.lsp-conf.helper');
    local def_opts = { noremap = true, silent = true, }
    ht.setup {
      hls = {
        on_attach = function(client, bufnr)
          local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
          -- haskell-language-server relies heavily on codeLenses,
          -- so auto-refresh (see advanced configuration) is enabled by default
          helper.on_attach(client, bufnr);
          vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts)
          vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
        end,
      },
    }
    ht.lsp.start();
    local leader = '<leader>h';
    -- Suggested keymaps that do not depend on haskell-language-server
    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', leader .. 'rr', ht.repl.toggle, def_opts)
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', leader .. 'rf', function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, def_opts)
    vim.keymap.set('n', leader .. 'rq', ht.repl.quit, def_opts)
  end
}

return { M }
