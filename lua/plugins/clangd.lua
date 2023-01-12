
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

    local function checkFile(path, filename)
      local scan = require("plenary.scandir")
      local scanned = scan.scan_dir(path, { hidden = false, depth = 1 })
      for _, file in pairs(scanned) do
        local file = file:match(filename)
        return true
      end
    end

    local function switchFunction()
      local extension = vim.fn.expand("%:e");
      local file = vim.fn.expand("%:r");
      if extension == 'c' or extension == 'cpp' then
        return file .. '.h';
      elseif vim.fn.expand("%:e") == 'h' then
        local filename = file .. '.cpp';
        if checkFile(vim.fn.expand("%:h"), filename) then return filename; end
        return file .. '.c';
      end
      return file .. '.cpp';
    end

    local function switch()
      vim.cmd(':e ' .. switchFunction());
    end

    local function splitSwitch()
      vim.cmd(':sp ' .. switchFunction());
    end

    local function vsplitSwitch()
      vim.cmd(':vsp ' .. switchFunction());
    end

    local function switchAlt(args)
      vim.cmd(':e ' .. vim.fn.expand("%:r") .. args['args'])
    end

    cmd('A', switch);
    cmd('AS', splitSwitch);
    cmd('AV', vsplitSwitch);
    cmd('AA', switchAlt, { nargs = 1 })

    local opts = lsp.build_options('clangd', {});
    local options = {
      server = opts,
    }
    require("clangd_extensions").setup(options);
    return nil;
  end
}

return { m };
