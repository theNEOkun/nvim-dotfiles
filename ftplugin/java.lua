local keymap = require('utils').map;
local u_cmd = require('utils').u_cmd;
local set = vim.opt;

set.tabstop = 4;
set.softtabstop = 4;
set.shiftwidth = 4;
set.expandtab = true;

vim.cmd("compiler ant");
local maven = "mvn";
vim.cmd("set makeprg=" .. maven);

local function getPackage()
  local info = vim.fn.expand("%:h");
  info = info:gsub('/', '.');
  for _, each in ipairs({ 'src.test.java.', 'src.main.java.', 'src.test.', 'src.main.' }) do
    info = info:gsub(each, '')
  end
  return info
end

local function getName()
  return vim.fn.expand("%:t:r");
end

keymap('n', '<leader>mr', '<cmd>:split<cr> :term<cr>i mvn compile exec:java<cr>');
keymap('n', '<leader>mt', '<cmd>:split<cr> :term<cr>i mvn test<cr>');

keymap({ 'n', 'x' }, '<leader>mp', function()
  local info = getPackage();
  vim.cmd(':normal ipackage ' .. info .. ';');
end)

u_cmd('Mt', ":!mvn -q test");

local pkgLine = 'package ' .. getPackage() .. ';';
local firstLine = 'public class ' .. getName() .. " {";
local constructor = '  public ' .. getName() .. "() { \t}"
local lastLine = "}";

u_cmd('Mf', ':norm i' .. pkgLine .. '<CR>' .. firstLine .. '<CR>' .. constructor .. '<CR>' .. lastLine)
