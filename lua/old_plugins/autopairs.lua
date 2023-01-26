local M = {
  'windwp/nvim-autopairs',
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
  },
  config = function()

    local npairs = require('nvim-autopairs')

    -- CMP integration
    local cmp_autopairs = require('nvim-autopairs.completion.cmp');
    local cmp = require('cmp');
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    );

    npairs.setup({
      check_ts = true,
      disable_filetype = {
        "TelescopePrompt"
      },
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
      },
      ignored_next_char = "[%w%.]",
      -- map_bs = false,
      -- map_cr = false,
    })

    -- local remap = require('utils').map;
    -- skip it, if you use another global object
    -- _G.MUtils = {}
    --
    -- MUtils.CR = function()
    --   if vim.fn.pumvisible() ~= 0 then
    --     if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
    --       return npairs.esc('<c-y>')
    --     else
    --       return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    --     end
    --   else
    --     return npairs.autopairs_cr()
    --   end
    -- end
    -- remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true })
    --
    -- MUtils.BS = function()
    --   if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    --     return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    --   else
    --     return npairs.autopairs_bs()
    --   end
    -- end
    -- remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true })
  end
}

return { M };
