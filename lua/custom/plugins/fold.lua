-- Universal folding with nvim-ufo
return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost', -- load as soon as a file opens
    keys = {
      {
        'zR',
        function()
          require('ufo').openAllFolds()
        end,
        desc = 'Open all folds',
      },
      {
        'zM',
        function()
          require('ufo').closeAllFolds()
        end,
        desc = 'Close all folds',
      },
    },
    init = function() -- core Vim options (run before the plugin loads)
      vim.o.foldcolumn = '1' -- show a fold column
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldlevel = 99 -- enough to keep folds open
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
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

  -- Removes the numbers while the arrows are still there on the same column:
  {
    'luukvbaal/statuscol.nvim',
    opts = function()
      local builtin = require 'statuscol.builtin'
      return {
        setopt = true,
        -- override the default list of segments with:
        -- number-less fold indicator, then signs, then line number & separator
        segments = {
          { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
          { text = { '%s' }, click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' }, condition = { true, builtin.not_empty }, click = 'v:lua.ScLa' },
        },
      }
    end,
  },
}
