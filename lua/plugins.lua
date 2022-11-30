require("bootstrap")
require("dep") {
  modules = {
    'lsp-conf.init',
    'neoTree',
    'treesitter-conf',
  },

  --Telescope
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function() require("telescope-conf") end,
  },

  --  'kosayoda/nvim-lightbulb'

  {
    'tpope/vim-dispatch'
  },

  --Debugging

  {
    'rcarriga/nvim-dap-ui',
    function() require('dapui').setup() end,
    requires = 'mfussenegger/nvim-dap',
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    function()
      M = require('nvim-dap-virtual-text').setup();
      require('dap.dap_init');
      return M;
    end,
    requires = 'mfussenegger/nvim-dap'

  },

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
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    function()
      require('line')
    end
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

  -- TODO things to do
  {
    'folke/todo-comments.nvim',
    function() require("todo-conf").setup() end
  },

  --require('autopairs')
  {
    'jiangmiao/auto-pairs'
  },

  ----RipGrep
  {
    'jremmen/vim-ripgrep'
  },

  ----Colors
  {
    'lunarvim/Onedarker.nvim',
  },
  {
    'olimorris/onedarkpro.nvim',
    function() require('onedarkpro').setup({
        dark_theme = "onedark_vivid"
      })
    end
  },
  {

    'NTBBloodbath/doom-one.nvim',
  },
  {
    'EdenEast/nightfox.nvim',
  },

  {
    'NvChad/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  },

  {
    'ThePrimeagen/vim-be-good'
  },
}
