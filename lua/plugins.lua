require("bootstrap")
require("dep") {
  modules = {
    prefix = "packages.",
    'lsp-conf.init',
    'dap.dap_init',
    'line',
    'neoTree',
    'telescope-conf',
    'treesitter-conf',
    'todo-conf',
    'colors',
  },

  --  'kosayoda/nvim-lightbulb'

  {
    'tpope/vim-dispatch'
  },

  --Debugging

  {
    'jbyuki/one-small-step-for-vimkind'
  },

  --Specific
  ----Rust
  {
    'simrat39/rust-tools.nvim',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-lua/plenary.nvim',
      'rust-lang/rust.vim',
      'ron-rs/ron.vim'
    },
  },

  --  'mfussenegger/nvim-jdtls';

  ----C/C++

  {
    'p00f/clangd_extensions.nvim'
  },
  -- JS
  {
    'rest-nvim/rest.nvim',
    function() require('rest-nvim').setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, ful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to nil if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
    opt = true,
    ft = { 'http' },
  },

  {
    'preservim/tagbar'
  },

  ----Line
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
  {
    'airblade/vim-gitgutter'
  },
  {
    'tpope/vim-fugitive'
  },

  ----Surrounding
  --  'tpope/vim-surround'
  {
    'kylechui/nvim-surround',
    function() require("nvim-surround").setup() end
  },
  --  'fladson/vim-kitty'
  --require('autopairs')
  {
    'jiangmiao/auto-pairs'
  },

  ----RipGrep
  {
    'jremmen/vim-ripgrep'
  },
  {
    'ThePrimeagen/vim-be-good'
  },
}
