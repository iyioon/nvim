-- ============================================================================
-- Todo Comments
-- ============================================================================
-- Highlight and search TODO, FIXME, NOTE, etc. in comments.
-- https://github.com/folke/todo-comments.nvim
-- ============================================================================

return {
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TodoQuickFix', 'TodoLocList', 'TodoTelescope', 'TodoTrouble' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
