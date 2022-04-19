local M = {}

--Changes the root_dir so as not to cascade all the way down to home-dir
M.server_config = function(_, opts)
	local root_files = {
		'.luarc.json',
		'.luacheckrc',
		'.stylua.toml',
		'selene.toml',
		'.git'
	}
	local util = require('lspconfig.util')
	local unpack = table.unpack or unpack
	opts.root_dir = function(fname)
		local root = util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
		if root == os.getenv('HOME') then
			root = vim.fn.getcwd()
		end
		return root
	end
	return opts
end

return M
