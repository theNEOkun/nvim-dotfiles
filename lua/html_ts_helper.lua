local cmd = require('utils').u_cmd;

local function switchFunction()
  local extension = vim.fn.expand("%:e");
  local file = vim.fn.expand("%:r");
  print(file)
  if extension == 'ts' then
    return file .. '.html';
  elseif vim.fn.expand("%:e") == 'html' then
    return file .. '.ts';
  end
end

local function switch()
  vim.cmd(':e ' .. switchFunction());
end

local function splitSwitch()
  vim.cmd(':sp ' .. switchFunction());
end

local function vsplitSwitch(cmd)
  vim.cmd(':vsp ' .. switchFunction());
end

cmd('A', switch);
cmd('AS', splitSwitch);
cmd('AV', vsplitSwitch);

-- local t = {};
-- t['src/app/**.html'] = {
--   alternate = 'src/app/{}.ts',
--   type = 'html'
-- };
-- t['src/app/**.ts'] = {
--   alternate = 'src/app/{}.html',
--   type = 'source'
-- };
-- vim.g.projectionist_heuristics = t;