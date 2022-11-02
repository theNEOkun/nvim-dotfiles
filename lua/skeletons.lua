local autocmd = require("utils").autocmd;

-- When createing a readme-file
autocmd("BufNewFile", {
	"README.md", "readme.md"
},
	"0r ~/library/skeletons/README.md")

-- When creating a bash-file
autocmd("BufNewFile", {
	"*.sh"
},
	"0r ~/library/skeletons/bash.sh")

-- When creating a makefile
autocmd("BufNewFile", {
	"Makefile", "makefile"
},
	"0r ~/library/skeletons/Makefile")
