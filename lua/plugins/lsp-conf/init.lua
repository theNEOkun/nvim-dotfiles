local scan = require("plenary.scandir")

local base = 'plugins.lsp-conf.custom_servers'

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

local home = os.getenv('HOME')

get_files(home .. "/.config/nvim/lua/plugins/lsp-conf")

return M
