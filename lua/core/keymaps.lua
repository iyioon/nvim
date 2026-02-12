-- ============================================================================
-- Core Keymaps
-- ============================================================================
-- Basic keymaps that don't depend on plugins.
-- Plugin-specific keymaps should be defined in their respective plugin configs.
-- See `:help vim.keymap.set()` for more information.
-- ============================================================================

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickfix navigation
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '[q', ':cprevious<CR>', { desc = 'Previous quickfix item' })

-- Buffer management
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = '[B]uffer [D]elete (close)' })

-- Window navigation (CTRL+hjkl)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Visual line movement (j/k respect wrapped lines when no count)
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Line navigation (visual lines)
vim.keymap.set({ 'n', 'v' }, '0', 'g0', { desc = 'Visual line start' })
vim.keymap.set({ 'n', 'v' }, '_', 'g^', { desc = 'Visual line first non-blank' })
vim.keymap.set({ 'n', 'v' }, '$', 'g$', { desc = 'Visual line end' })

-- Toggle spell checking
vim.keymap.set('n', '<leader>ts', function()
  vim.wo.spell = not vim.wo.spell
end, { desc = '[T]oggle [S]pell' })
