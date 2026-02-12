-- ============================================================================
-- Zen Mode
-- ============================================================================
-- Distraction-free coding mode.
-- https://github.com/folke/zen-mode.nvim
-- ============================================================================

return {
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      { '<leader>tz', '<cmd>ZenMode<CR>', desc = '[T]oggle [Z]en mode' },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 1.0,
        height = 1,
        options = {
          signcolumn = 'no',
          cursorline = true,
          foldcolumn = '0',
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        gitsigns = { enabled = false },
        tmux = { enabled = true },
      },
      on_open = function(win)
        -- Custom actions on zen mode open
      end,
      on_close = function()
        -- Custom actions on zen mode close
      end,
    },
  },
}
