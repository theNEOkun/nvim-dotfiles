return {
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', },
    function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '|', right = '|' },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = { { 'mode', color = 'StatusLine' } },
          lualine_b = {
            { 'branch', color = 'StatusLine' },
            { 'diff', color = 'StatusLine' },
            { 'diagnostics', color = 'StatusLine' }
          },
          lualine_c = { 'filename' },
          lualine_f = {},
          lualine_x = {},
          lualine_y = { { 'filetype', color = 'StatusLine' } },
          lualine_z = { { 'location', color = 'StatusLine' } }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
      }
    end
  },
}
