-- ============================================================================
-- Conform - Formatting
-- ============================================================================
-- Autoformatting with support for multiple formatters.
-- https://github.com/stevearc/conform.nvim
-- ============================================================================

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        html = { 'prettier' },
        css = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        python = { 'isort', 'black' },
      },
    },
  },
}
