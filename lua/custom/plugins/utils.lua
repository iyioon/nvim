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

  { -- Mini surround
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
      },
    },
  },

  -- Auto Tag
  {
    'windwp/nvim-ts-autotag',
    opts = {
      -- Defaults
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = false, -- Auto close on trailing </
    },
  },

  -- GitHub Copilot
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter', -- load when you enter Insert mode
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('copilot').setup {
        panel = {
          auto_refresh = false,
          keymap = {
            accept = '<CR>', -- enter to accept in panel
            jump_prev = '[[', -- go up
            jump_next = ']]', -- go down
            refresh = 'gr', -- refresh suggestions
            open = '<M-CR>', -- Alt-Enter to open panel
          },
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<M-l>', -- Alt-l to accept
            prev = '<M-[>', -- Alt-[ to go to previous suggestion
            next = '<M-]>', -- Alt-] to go to next suggestion
            dismiss = '<C-]>', -- Ctrl-] to dismiss
          },
        },
      }
    end,
  },

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
      -- {
      --   's',
      --   mode = { 'n', 'x', 'o' },
      --   function()
      --     require('flash').jump()
      --   end,
      --   desc = 'Flash',
      -- },
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
