-- ============================================================================
-- Core Autocommands
-- ============================================================================
-- Autocommands that don't depend on plugins.
-- Plugin-specific autocommands should be in their respective configs.
-- See `:help lua-guide-autocommands` for more information.
-- ============================================================================

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('config-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
