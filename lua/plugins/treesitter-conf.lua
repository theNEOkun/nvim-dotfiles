return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'windwp/nvim-ts-autotag' },
      { 'mrjones2014/nvim-ts-rainbow' },
      { 'RRethy/nvim-treesitter-endwise' },
      -- { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
      { 'nvim-treesitter/playground' },
    },
    build = function() vim.cmd(':TSUpdate') end,
    config = function()
      require('ts_context_commentstring').setup {};
      vim.g.skip_ts_context_commentstring_module = true;
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "c", "javascript", "typescript", "lua", "cpp", "markdown", "markdown_inline",
          "kotlin", "java", "json", "html", "latex", "css", "comment", 'zig' },
        ignore_install = { "phpdoc" },
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        highlight = {
          enable = true
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
      }
    end
  },
}
