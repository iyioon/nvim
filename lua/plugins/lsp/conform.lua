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
      -- Uncomment to enable format on save:
      -- format_on_save = function(bufnr)
      --   local disable_filetypes = { c = true, cpp = true }
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     return nil
      --   else
      --     return { timeout_ms = 500, lsp_format = 'fallback' }
      --   end
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        html = { 'prettier' },
        css = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        python = { 'isort', 'black' },
        -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
}
