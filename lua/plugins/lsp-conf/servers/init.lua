local base = 'plugins.lsp-conf.servers'

local M = {}

M["jdtls"] = {
  server_config = function()
    return {
      capabilities = {
        dynamicRegistration = true;
      }
    }
  end,
  on_attach = function(client, bufnr)
    require('plugins.lsp-conf.helper').on_attach(client, bufnr);
  end
}

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

require('utils').get_files(home .. "/.config/nvim/lua/plugins/lsp-conf/servers", 
function(file)
    local file = file:match("^.*/(.*).lua$")
    if file ~= "init" then
      M[file] = require(base .. "." .. file)
    end
end)

return M
