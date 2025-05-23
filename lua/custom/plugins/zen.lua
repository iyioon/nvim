-- Distraction-free coding with zen-mode.nvim
return {
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
        cursorline = false,
        foldcolumn = '0',
      },
    },
    plugins = {
      -- Disable ruler and command display in zen mode
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      -- Hide git signs in zen mode
      gitsigns = { enabled = false },
      -- Hide tmux status bar in zen mode
      tmux = { enabled = true },
    },
    -- Callback for when zen mode opens
    on_open = function(win)
      -- Additional customization when zen mode opens
    end,
    -- Callback for when zen mode closes
    on_close = function()
      -- Additional customization when zen mode closes
    end,
  },
}

