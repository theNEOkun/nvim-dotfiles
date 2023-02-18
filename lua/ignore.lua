local M = {}

local except = {
  "Makefile",
}

M.run = function()
  -- Copied some from [this](https://www.vim.org/scripts/script.php?script_id=2557)
  require('utils').check_file('.gitignore', function(file)
    local t = {
      vim.opt.wildignore['_value']
    };
    for line in io.lines(file) do
      local line = line:gsub('%s|%n|%r', '');
      local line = line:gsub(',', '\\\\,');
      if line:match('^#') or line == '' or line:match('^!') then
        goto continue;
      end
      for _, value in pairs(except) do
        if line:match(value) then
          goto continue;
        end
      end
      if line:match('%w/') then
        t[#t + 1] = line .. '*';
        goto continue;
      end
      if line:match('/$') then
        t[#t + 1] = line .. '*';
        goto continue;
      end
      t[#t + 1] = line;
      ::continue::
    end
    vim.opt.wildignore = table.concat(t, ',');
  end)
end

M.rerun = function()
  if vim.g.global_excepts then
    local new = vim.opt.wildignore['_value'];
    for _, value in pairs(vim.g.global_excepts) do
      new = new:gsub(',' .. value, '');
    end
    vim.opt.wildignore = new;
  end
end

return M;
