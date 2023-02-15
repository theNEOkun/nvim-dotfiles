local M = {};

M.insert_link = function()
  local word = require('utils').get_visual_text()[1];
  local command = '\href{<insert link>}{' .. word .. '}';
  vim.cmd('norm gvs'..command);
end

M.insert_link_on_word = function ()
  vim.cmd('norm viw');
  require'markdown'.insert_link();
end

M.highlight = function()
  local word = require('utils').get_visual_text()[1];
  local command = '\textbf{' .. word .. '}';
  vim.cmd('norm gvs'..command);
end

M.italisize = function()
  local word = require('utils').get_visual_text()[1];
  local command = '\textit{' .. word .. '}';
  vim.cmd('norm gvs'..command);
end

return M;
