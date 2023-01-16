local M = {};

M.insert_link = function()
  local word = require('utils').get_visual_text()[1];
  vim.pretty_print(word);
  local command = '[' .. word .. ']()';
  vim.pretty_print(command);
  vim.cmd('norm gvs'..command);
end

M.highlight = function()
  local word = require('utils').get_visual_text()[1];
  vim.pretty_print(word);
  local command = '**' .. word .. '**';
  vim.pretty_print(command);
  vim.cmd('norm gvs'..command);
end

return M;
