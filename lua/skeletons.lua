local autocmd = require("utils").autocmd;
local autogroup = require("utils").autogroup;

local augroup = autogroup("skeletoncreation");

local list = {
	{ "README.md", "readme.md" },
	{ "Makefile", "makefile" },
	{ "bash.sh", "*.sh" },
	{ "main.c" },
	{ "main.cpp" },
	{ "main.js" },
	{ "index.html" },
	{ "build.xml" },
	{ "main.py" },
	{ ".classpath" },
	{ ".project" },
};

for _, item in pairs(list) do

	autocmd("BufNewFile",
		item,
		"0r ~/library/skeletons/"..item[1], -- Use the first item in the inner list to get the file
		augroup) -- Same augroup for everyone
end
