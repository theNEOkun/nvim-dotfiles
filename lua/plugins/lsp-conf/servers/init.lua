local scan = require("plenary.scandir")

local base = 'plugins.lsp-conf.servers'

local M = {}

local get_files = function(path)
  local scanned = scan.scan_dir(path, { hidden = false, depth = 1 })
  for _, file in pairs(scanned) do
    local file = file:match("^.*/(.*).lua$")
    if file ~= "init" then
      M[file] = require(base .. "." .. file)
    end
  end
end

-- M["marksman"] = {
--   server_config = function()
--
--   end,
--   on_attach = function (client, bufnr)
--     require( 'plugins.lsp-conf.helper' ).on_attach(client, bufnr);
--     vim.api.nvim_buf_set_option(bufnr, "formatexpr", "");
--   end
-- }

local home = os.getenv('HOME')

get_files(home .. "/.config/nvim/lua/plugins/lsp-conf/servers")

return M
