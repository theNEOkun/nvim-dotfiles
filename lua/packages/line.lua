local function window()
  return vim.api.nvim_win_get_number(0);
end

local m = {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', },
    function()
      local keymap = require('utils').map;
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
          lualine_x = { 'location', window },
          lualine_y = {},
          lualine_z = {}
        },
      }
      for i = 1, 6 do
        local lhs = "<leader>" .. i
        local rhs = i .. "<C-W>w";
        keymap({ 'n' }, lhs, rhs, { desc = "Move to window " .. i });
      end
    end
  }

return { m }
