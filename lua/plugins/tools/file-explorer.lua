-- ============================================================================
-- File Explorers
-- ============================================================================
-- Oil.nvim and Neo-tree for file navigation.
-- ============================================================================

return {
  -- Oil - Edit filesystem like a buffer
  {
    'stevearc/oil.nvim',
    cmd = { 'Oil' },
    keys = {
      { '<leader>E', '<cmd>Oil<CR>', desc = 'Open Oil file explorer' },
    },
    config = function()
      function _G.get_oil_winbar()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
        local dir = require('oil').get_current_dir(bufnr)
        if dir then
          return vim.fn.fnamemodify(dir, ':~')
        end
        return vim.api.nvim_buf_get_name(0)
      end

      require('oil').setup {
        default_file_explorer = false,
        delete_to_trash = true,
        watch_for_changes = true,
        win_options = {
          winbar = '%!v:lua.get_oil_winbar()',
        },
        show_hidden = false,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      }
    end,
  },

  -- Neo-tree - Tree view file explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Neotree toggle' },
      { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus Neotree' },
    },
    config = function()
      require('neo-tree').setup {
        default_component_configs = {
          indent = {
            indent_size = 1,
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            with_expanders = nil,
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
        },
        close_if_last_window = true,
        window = {
          width = 40,
          mappings = {
            ['<space>'] = 'none',
          },
        },
        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          filtered_items = {
            visible = true,
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
      }
    end,
  },
}
