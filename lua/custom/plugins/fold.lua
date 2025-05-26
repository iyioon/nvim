-- Universal folding with nvim-ufo
return {
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
}
