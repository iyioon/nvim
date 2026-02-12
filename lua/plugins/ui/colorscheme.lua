-- ============================================================================
-- Colorscheme
-- ============================================================================
-- Cyberdream colorscheme with custom settings.
-- https://github.com/scottmckendry/cyberdream.nvim
-- ============================================================================

return {
  {
    'scottmckendry/cyberdream.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('cyberdream').setup {
        saturation = 1,
        transparent = true,
      }
      vim.cmd.colorscheme 'cyberdream'

      -- Custom Visual highlight
      vim.api.nvim_set_hl(0, 'Visual', {
        bg = '#7f3aa0',
        fg = 'NONE',
        blend = 20,
      })

      -- Line number customizations
      vim.api.nvim_create_autocmd('VimEnter', {
        pattern = '*',
        callback = function()
          vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ff5ef1' })
          vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#707889' })
          vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#707889' })
          vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ff5ef1', bold = true })
          vim.o.cursorline = true
        end,
      })

      -- Matching parentheses
      vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#7f3aa0', fg = '#ffffff', bold = true })

      -- Cursor highlighting
      vim.o.guicursor = 'n-v-c:block-Cursor,i:ver25-CursorInsert'
      vim.api.nvim_set_hl(0, 'Cursor', { bg = '#ff5ef1' })
      vim.api.nvim_set_hl(0, 'CursorInsert', { bg = '#ff5ef1' })
      vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#7f3aa0' })
    end,
  },
}
