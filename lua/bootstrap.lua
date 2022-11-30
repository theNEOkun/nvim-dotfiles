-- automatically install `chiyadev/dep` on startup
local path = vim.fn.stdpath("data") .. "/site/pack/deps/opt/dep"

if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path })
end

vim.cmd("packadd dep")
