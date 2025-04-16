-- Utility plugins like file explorer, terminal, window management, etc.
return {
  { -- Allow you to pick a window to open a file in
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        hint = 'floating-big-letter',
        picker_config = {
          handle_mouse_click = true,
        },
      }
    end,
  },

  { -- NeoTree for file explorer
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle Explorer' },
      { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus Explorer' },
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        window = {
          width = 30,
          mappings = {
            ['<space>'] = 'none', -- Disable space mapping to not conflict with leader key
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true, -- Focus the file that's currently being edited
          },
          use_libuv_file_watcher = true, -- Use the system file watcher to auto refresh
          filtered_items = {
            visible = true, -- When true, hidden files will be shown
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          window = {
            mappings = {
              ['o'] = 'open_with_window_picker',
              ['<cr>'] = 'open_with_window_picker',
              ['s'] = 'open_split',
              ['v'] = 'open_vsplit',
            },
          },
        },
        event_handlers = {
          -- {
          --   -- This is the key event that closes Neo-tree after opening a file
          --   event = 'file_opened',
          --   handler = function()
          --     require('neo-tree.command').execute { action = 'close' }
          --   end,
          -- },
        },
      }
    end,
  },

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
    end,
  },

  -- GitHub Copilot
  'github/copilot.vim',

  -- Vim Easy Align
  {
    'junegunn/vim-easy-align',
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Align Text" },
    },
    config = function()
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
    end,
  },
}

