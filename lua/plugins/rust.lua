local M = {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-lua/plenary.nvim',
    'VonHeikemen/lsp-zero.nvim',
  },
  ft="rust",
  config = function()

    local extension_path = os.getenv('HOME') .. '/library/vscode_lldb/extension';
    local codelldb_path = extension_path .. '/adapter/codelldb';
    local lidlldb_path = extension_path .. '/lldb/lib/liblldb.so';

    local rust_lsp = require('lsp-zero').build_options('rust_analyzer', {});

    local rust_opts = {
      tools = {
        hover_actions = {
          auto_focus = true
        },
        inlay_hints = {
          auto = true,
        }
      },
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
          'codelldb', lidlldb_path
        )
      },
      server = rust_lsp,
    }
    require('rust-tools').setup(rust_opts)
  end
}

return { M };
