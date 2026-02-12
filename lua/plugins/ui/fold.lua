-- ============================================================================
-- Folding with nvim-ufo
-- ============================================================================
-- Universal folding with LSP and treesitter support.
-- https://github.com/kevinhwang91/nvim-ufo
-- ============================================================================

return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost',
    keys = {
      { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
      { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    },
    init = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      -- Note: fillchars for fold icons set after UI loads to avoid startup issues
    end,
    opts = {
      provider_selector = function(_, ft)
        if ft == 'markdown' then
          return { 'treesitter', 'indent' }
        end
        return { 'lsp', 'indent' }
      end,
    },
  },

  -- Statuscolumn with fold indicators
  {
    'luukvbaal/statuscol.nvim',
    opts = function()
      local builtin = require 'statuscol.builtin'
      return {
        setopt = true,
        segments = {
          { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
          { text = { '%s' }, click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' }, condition = { true, builtin.not_empty }, click = 'v:lua.ScLa' },
        },
      }
    end,
  },
}
