local keymap = require('utils').map;
local u_cmd = require('utils').u_cmd;


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


-- NVIM-JDTLS
-- local jdtls = require('jdtls');
--
-- local home = os.getenv('HOME');
-- local root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw', 'pom.xml', '.classpath' }, { upward = true })[1]);
-- local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
--
-- local config = require 'coq'.lsp_ensure_capabilities {
--   cmd = {
--     home .. '/.local/share/nvim/mason/bin/jdtls'
--   },
--   root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw', 'pom.xml', '.classpath' }, { upward = true })[1]),
--   settings = {
--     java = {
--       configuration = {
--         -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--         -- And search for `interface RuntimeOption`
--         -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
--         runtimes = {
--           {
--             name = "JavaSE-17",
--             path = "/usr/lib/jvm/java-17-openjdk/",
--           },
--         }
--       }
--     }
--   },
--   on_attach = function(client, bufnr)
--     require'jdtls.setup'.add_command();
--   end
-- }
-- jdtls.start_or_attach(config)
