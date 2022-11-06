local autocmd = require("utils").autocmd;
local autogroup = require("utils").autogroup;

local augroup = autogroup("skeletoncreation");

-- When createing a readme-file
autocmd("BufNewFile",
	{ "README.md", "readme.md" },
	"0r ~/library/skeletons/README.md",
	augroup)

-- When creating a bash-file
autocmd("BufNewFile",
	{ "*.sh" },
	"0r ~/library/skeletons/bash.sh",
	augroup)

-- When creating a makefile
autocmd("BufNewFile",
	{ "Makefile", "makefile" },
	"0r ~/library/skeletons/Makefile",
	augroup)

-- When creating a new c-main
autocmd("BufNewFile",
	{ "main.c" },
	"0r ~/library/skeletons/c_main",
	augroup)
--
-- When creating a new c-main
autocmd("BufNewFile",
	{ "main.cpp" },
	"0r ~/library/skeletons/cpp_main",
	augroup)
