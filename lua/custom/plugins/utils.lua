-- Utility plugins for better coding experience
return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        hint = 'floating-big-letter',
        picker_config = { handle_mouse_click = true },
      }

      -- correct keybinding
      vim.keymap.set('n', '<C-w>', function()
        local win = require('window-picker').pick_window()
        if win then
          vim.api.nvim_set_current_win(win)
        end
      end, {
        desc = 'Pick a window',
        noremap = true,
        silent = true,
        nowait = true,
      })
    end,
  },

  { -- Mini surround (Custom key gs)
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
      },
    },
  },

  -- GitHub Copilot
  'github/copilot.vim',

  -- Vim Easy Align
  {
    'junegunn/vim-easy-align',
    keys = {
      { 'ga', '<Plug>(EasyAlign)', mode = { 'n', 'x' }, desc = 'Align Text' },
    },
    config = function()
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
    end,
  },

  -- Flash for better navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
    },
  },
}
