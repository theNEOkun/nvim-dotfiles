local M = {}

local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local sv_path = vim.fn.stdpath("config") .. "/spell/sv.utf-8.add"
local words = {}
local sv_words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

for word in io.open(sv_path, "r"):lines() do
  table.insert(sv_words, word)
end

M.server_config = function()
  local opts = {};
  opts.settings = {
    ltex = {
      dictionary = {},
      disabledRules = {},
      hiddenFalsePositives = {}
    }
  }
  return opts
end

M.on_attach = function(client, bufnr)
  require('plugins.lsp-conf.helper').on_attach(client, bufnr);
  client.config.settings.ltex['dictionary']['en-US'] = words;
  client.config.settings.ltex['dictionary']['en-GB']= words;
  client.config.settings.ltex['dictionary']['sv'] = sv_words;
end

return M;
