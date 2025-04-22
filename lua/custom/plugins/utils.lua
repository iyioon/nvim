-- Utility plugins for better coding experience
return {
  { -- Allow you to pick a window to open a file in
    -- Use this with NeoTree
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
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
}
