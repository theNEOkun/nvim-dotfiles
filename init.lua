if vim.g.vscode then
    require('general')
    require('keymaps')
    require('skeletons')
else
    require('general')
    require('keymaps')
    require('spellchecking')
    require('skeletons')
    require('autocommands')
    require('bootstrap')
    require('lazy').setup("plugins")
    require('plugins')
    require('ignore')
end
