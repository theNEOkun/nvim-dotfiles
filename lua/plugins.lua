require("bootstrap")
require("dep") {
    modules = {
        prefix = "packages.",
        'lsp-conf.init',
        'dap.init',
        'line',
        'eyeline',
        -- 'neoTree',
        'netrw',
        'harp',
        'telescope-conf',
        'treesitter-conf',
        'todo-conf',
        'colors',
        'rest',
        'autopairs',
        'which',
        'projections',
        'rust',
        'clangd',
        'git',
    },

    -- 'vim-airline/vim-airline'
    {
        'kyazdani42/nvim-web-devicons',
        config = function() require("nvim-web-devicons").setup() end,
    },
    {
        'numToStr/Comment.nvim',
        function()
            require('Comment').setup()
        end
    },

    ----GIT

    ----Surrounding
    --  'tpope/vim-surround'
    {
        'kylechui/nvim-surround',
        function() require("nvim-surround").setup() end
    },
    --  'fladson/vim-kitty'
    -- require('autopairs')

    ----RipGrep
    {
        'jremmen/vim-ripgrep'
    },
}
