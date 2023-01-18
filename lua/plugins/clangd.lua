
local m = {
  url = "https://git.sr.ht/~p00f/clangd_extensions.nvim",
  ft = { 'c', 'cpp' },
  dependencies = {
    'VonHeikemen/lsp-zero.nvim',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local lsp = require('lsp-zero');
    local cmd = require('utils').u_cmd;

    local opts = lsp.build_options('clangd', {});
    local options = {
      server = opts,
    }

    local function switchFunction()
      return "ClangdSwitchSourceHeader";
    end

    local function switch()
      vim.cmd(switchFunction());
    end

    local function splitSwitch()
      vim.cmd(':sp |' .. switchFunction());
    end

    local function vsplitSwitch()
      vim.cmd(':vsp |' .. switchFunction());
    end

    cmd('A', switch);
    cmd('AS', splitSwitch);
    cmd('AV', vsplitSwitch);

    require("clangd_extensions").setup(options);
  end
}

return { m };
