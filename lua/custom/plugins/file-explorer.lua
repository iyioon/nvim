return {
  { -- NeoTree File Explorer
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>E', '<cmd>Neotree toggle<cr>', desc = 'Neotree toggle' },
      { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus Neotree' },
    },
    config = function()
      require('neo-tree').setup {
        default_component_configs = {
          indent = {
            indent_size = 1,
            -- indent guides
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
        },

        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        window = {
          width = 40,
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
            hide_dotfiles = false, -- Hide dotfiles
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
}
