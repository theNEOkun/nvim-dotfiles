if vim.g.vscode then
    require('general')
    require('keymaps')
    require('skeletons')
else
    require('general')
    require('keymaps')
    require('skeletons')
    require('autocommands')
    require('bootstrap')
    require('lazy').setup("plugins")
    require('plugins')
end
