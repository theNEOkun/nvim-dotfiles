-- -- automatically install `chiyadev/dep` on startup
-- local path = vim.fn.stdpath("data") .. "/site/pack/deps/opt/dep"
--
-- if vim.fn.empty(vim.fn.glob(path)) > 0 then
--   vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path })
-- end
--
-- vim.cmd("packadd dep")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
     "git",
     "clone",
     "--filter=blob:none",
     "--single-branch",
     "https://github.com/folke/lazy.nvim.git",
     lazypath,
   })
 end
 vim.opt.runtimepath:prepend(lazypath)
