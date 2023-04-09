--https://gitlab.com/CraftedCart/dotfiles/-/blob/00ec7b1bb31be2871f0dacdda5ea6de04e59b067/.config/nvim/lua/c/keybind.lua

local M = {}

M.keybind = {}

local keymap = vim.keymap.set
local api = vim.api

--Used to map to a keybinding
--@param mode is the mode for the keybinding
--@param keys are the keys to be pressed
--@param command is the command to execute
--@param opts are the options to use
M.map = function(mode, keys, command, opts)
  local options = { noremap = false, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  keymap(mode, keys, command, options)
end

--Used to map to a keybinding
--@param bufnr is the buffer to attach to
--@param mode is the mode for the keybinding
--@param keys are the keys to be pressed
--@param command is the command to execute
--@param opts are the options to use
M.buf_map = function(bufnr, mode, keys, command, opts)
  local options = { noremap = true, silent = false, buffer = bufnr }
  if opts then options = vim.tbl_extend("force", options, opts) end
  keymap(mode, keys, command, options)
end

M.autogroup = function(group_name)
  return api.nvim_create_augroup(group_name, { clear = false });
end

-- Creates an autocommand "easier"
-- @param actions are the actions to do the command on
-- @param aupattern is the pattern to listen formd
-- @param aucommand is the command to do
M.autocmdf = function(actions, aupattern, aucommand, augroup)
  api.nvim_create_autocmd(actions, {
    pattern = aupattern,
    group = augroup,
    callback = aucommand,
  });
end

-- Creates an autocommand "easier"
-- @param actions are the actions to do the command on
-- @param aupattern is the pattern to listen formd
-- @param aucommand is the command to do
M.autocmd = function(actions, aupattern, aucommand, augroup)
  api.nvim_create_autocmd(actions, {
    pattern = aupattern,
    group = augroup,
    command = aucommand,
  });
end

-- Creates a user-command
-- @param command is the command to listen for
-- @param func is the function to execute
-- @param args are the args to give
M.u_cmd = function(command, func, args)
  local l_args = { nargs = 0 };
  if args then l_args = vim.tbl_extend("force", l_args, args) end
  api.nvim_create_user_command(
    command,
    func,
    l_args
  );
end

-- Just a split function because Lua does not have this, nothing more
-- Borrowed from [rest-nvim/rest.nvim](www.github.com/)
-- @param str String to split
-- @param sep Separator
-- @param max_splits Number of times to split the string (optional)
M.split = function(str, sep, max_splits)
  if sep == nil then
    sep = "%s"
  end
  max_splits = max_splits or -1

  local str_tbl = {}
  local nField, nStart = 1, 1
  local nFirst, nLast = str:find(sep, nStart)
  while nFirst and max_splits ~= 0 do
    str_tbl[nField] = str:sub(nStart, nFirst - 1)
    nField = nField + 1
    nStart = nLast + 1
    nFirst, nLast = str:find(sep, nStart)
    max_splits = max_splits - 1
  end
  str_tbl[nField] = str:sub(nStart)

  return str_tbl
end

local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.visual_range = function()
  -- local _, csrow, cscol, _ = unpack(vim.fn.getpos("v"));
  -- local _, cerow, cecol, _ = unpack(vim.fn.getpos("."));
  local csrow, cscol = -1, -1;
  local cerow, cecol = -1, -1;
  if vim.api.nvim_get_mode().mode == 'v' then
    csrow, cscol = unpack(vim.api.nvim_buf_get_mark(0, "v"));
    cerow, cecol = unpack(vim.api.nvim_buf_get_mark(0, "."));
  else
    csrow, cscol = unpack(vim.api.nvim_buf_get_mark(0, "<"));
    cerow, cecol = unpack(vim.api.nvim_buf_get_mark(0, ">"));
  end
  if (cecol > 1000) then
    cecol = vim.fn.col('$') - 1;
  end
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return { csrow - 1, cscol }, { cerow - 1, cecol + 1 }
  else
    return { cerow - 1, cecol }, { csrow - 1, cscol + 1 }
  end
end

-- Method to get the information in the visual selection
M.get_visual_selection = function(start, stop, type)
  local text = vim.api.nvim_buf_get_text(0, start[1], start[2], stop[1], stop[2], {});
  -- local text = vim.region(0, start, stop, type, true);
  return text;
end

M.get_visual_text = function()
  local start, stop = M.visual_range();
  -- vim.pretty_print(start, stop);
  local text = M.get_visual_selection(start, stop);
  -- vim.pretty_print(text);
  return text
end

M.calculate_selection = function()
  local text = M.get_visual_text();
  local cmd = t("echo " .. text[1] .. " | bc");
  local result = vim.fn.system(cmd);
  vim.cmd("norm gv h s")
  vim.api.nvim_put(result, 'l', true, false);
end

M.get_files = function(path, func)
  local scan = require("plenary.scandir")
  local scanned = scan.scan_dir(path, { hidden = true, depth = 1 })
  for _, file in pairs(scanned) do
    func(file)
  end
end

M.check_file = function(path, func)
  if io.open(path) then
    func(path)
  end
end

M.escape = function(word)
  local escape_lua_pattern
  do
    local matches =
    {
      ["^"] = "%^",
      ["$"] = "%$",
      ["("] = "%(",
      [")"] = "%)",
      ["%"] = "%%",
      ["."] = "%.",
      ["["] = "%[",
      ["]"] = "%]",
      ["*"] = "%*",
      ["+"] = "%+",
      ["-"] = "%-",
      ["?"] = "%?",
    }

    escape_lua_pattern = function(s)
      return (s:gsub(".", matches))
    end
  end
  return escape_lua_pattern(word);
end

return M
