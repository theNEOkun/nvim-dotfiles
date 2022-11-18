local keymap = require('utils').map;
local split = require('utils').split;
local g = vim.g;
--General

require('utils').map('n', '<space>', '<nop>');
g.mapleader = " ";

--Tabs
--Next
keymap('n', '<A-t>', '<cmd>:tabn<CR>');
--New
keymap('n', '<A-e>', '<cmd>:tabe<CR>');
--Close
keymap('n', '<A-q>', '<cmd>:tabc<CR>');

--Increment and Decrement
keymap('n', '+', '<C-a>');
keymap('n', '-', '<C-x>');

--Copy visually selected to clipboard
keymap('x', '<C-c>', '"+y', {});

--Paste from clipboard
keymap('n', '<C-p>', '"+p', {});
keymap('x', '<C-p>', '"+p', {});

-- save
keymap('n', '<C-s>', ':wa<CR>');
keymap('i', '<C-s>', '<C-o>:wa<CR>');

--move text
keymap('n', '<C-j>', ':m .+1<CR>==');
keymap('n', '<C-k>', ':m .-2<CR>==');
keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi');
keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi');
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv");
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv");

-- ENter just a line
keymap({ 'n', 'v' }, '<leader>o', 'o<ESC>');
keymap({ 'n', 'v' }, '<leader>O', 'O<ESC>');

-- Remove arrow-keys
keymap({ 'n', 'v' }, '<Up>', '<Nop>');
keymap({ 'n', 'v' }, '<Down>', '<Nop>');
keymap({ 'n', 'v' }, '<Left>', '<Nop>');
keymap({ 'n', 'v' }, '<Right>', '<Nop>');

-- Some custom text-objects
-- Work on an entire line, either with or without the whitespace
keymap({ 'o', 'x' }, 'il', ':<C-u>norm! $v^<CR>', { silent = true });
keymap({ 'o', 'x' }, 'al', ':<C-u>norm! $v0<CR>', { silent = true });

-- Work on the entire file
keymap({ 'o', 'x' }, 'aa', ':<C-u>norm! gg^vG$<CR>', { silent = true });

keymap('n', '<leader>t', function()
	local variables = {}

	-- If there is a line at the beginning with @ first
	if vim.fn.search('^@', 'cn') > 0 then
		-- Read all lines of the file
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true);

		-- For each line
		for _, line in pairs(lines) do
			-- Get all that starts with @
			if line:match("^@[%w!@#$%^&*-_+?~]+%s*=%s*[^=]+") then
				-- Read them off
				local place = split(line, '=', 1);
				-- Remove whitespace around them
				for i, each in ipairs(place) do
					place[i] = each:gsub(" ", "");
				end
				-- Add to variables, and remove the @
				variables[place[1]:gsub('@', '')] = place[2];
			else
				break
			end
		end
	end

	-- For each variable name
	for name, _ in pairs(variables) do
		-- For each pair of variables
		for oname, ovalue in pairs(variables) do
			-- If a variable contains another variable
			if variables[name]:match(oname) then
				-- Add that into the variable
				-- I.E if @url={{path}}:{{port}}/{{source}}
				-- Substitue in path, port and source
				variables[name] = variables[name]:gsub('{{' .. oname .. '}}', ovalue);
			end
		end
	end

	vim.pretty_print(variables);
end)
