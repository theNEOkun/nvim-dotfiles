return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'windwp/nvim-ts-autotag' },
      { 'mrjones2014/nvim-ts-rainbow' },
      { 'RRethy/nvim-treesitter-endwise' },
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
      { 'nvim-treesitter/playground' },
    },
    build = function() vim.cmd(':TSUpdate') end,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "c", "javascript", "typescript", "lua", "cpp", "markdown", "markdown_inline",
          "kotlin", "java", "json", "html", "latex", "css", "help", "comment" },
        ignore_install = { "phpdoc" },
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        context_commentstring = {
          enable = true,
        },
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
        endwise = {
          enable = true
        },
        autotag = {
          enable = true
        },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              -- ["al"] = "@loop.outer",
              -- ["il"] = "@loop.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
          },
        },
      }
    end
  },
}
