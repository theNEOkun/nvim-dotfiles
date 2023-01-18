local M = {}

M.server_config = function()
  return {};
end

M.on_attach = function(client, bufnr)
  require('plugins.lsp-conf.helper').on_attach(client, bufnr)
  local cmd = require('utils').u_cmd;

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
end

return M;
