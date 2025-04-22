return {
  { -- Toggle Terminal
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        -- Terminal window size
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,

        -- Open terminal in current directory
        start_in_insert = true,

        -- Default terminal direction
        direction = 'float', -- 'horizontal', 'vertical', or 'float'

        -- Floating terminal settings
        float_opts = {
          -- Border style
          border = 'curved', -- 'single', 'double', 'shadow', 'curved'
          winblend = 0,
        },

        -- Shell to use
        shell = vim.o.shell,
      }

      -- Setup keybindings
      vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
      vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })
      vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
      vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })

      -- Exit on double tapping Esc
      vim.keymap.set('t', '<Esc><Esc>', function()
        require('toggleterm').toggle(1) -- or use the terminal ID you opened
      end, { desc = 'Close ToggleTerm with Esc Esc' })

      -- When single Esc is pressed, go to normal mode to allow navigation inside terminal
      vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Go to normal mode' })
    end,
  },
}
