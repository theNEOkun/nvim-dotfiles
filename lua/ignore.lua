local filename = './.gitignore';

-- Copied some from [this](https://www.vim.org/scripts/script.php?script_id=2557)
require('utils').get_files('.', function(file)
  if file == filename then
    local t = {
      vim.opt.wildignore['_value']
    };
    for line in io.lines(file) do
      local line = line:gsub('%s|%n|%r', '');
      local line = line:gsub(',', '\\\\,');
      if line:match('^#') or line == '' or line:match('^!') then
        goto continue;
      end
      if line:match('/$') then
        t[#t+1] = "," .. line .. '*';
        goto continue;
      end
      t[#t + 1] = line;
      ::continue::
    end
    vim.opt.wildignore = table.concat(t, ',');
  end
end)
