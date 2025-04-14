-- UI related plugins: status line, color scheme, etc.
return {
  { -- Cyberdream colorscheme with custom contrast and transparency
    'scottmckendry/cyberdream.nvim',
    priority = 1000, -- Ensure it loads before other UI plugins
    lazy = false, -- Load this plugin at startup
    config = function()
      require('cyberdream').setup {
        saturation = 0.5, -- Set to a value less than 1.0 for slightly less contrast
        transparent = false,
        colors = {
          bg = '#24252F',
        },
      }
      vim.cmd.colorscheme 'cyberdream'

      -- Custom light purple Visual highlight
      vim.api.nvim_set_hl(0, 'Visual', {
        bg = '#6C4E9B', -- Light purple color
        fg = 'NONE', -- Keep text color the same
      })
    end,
  },

  { -- Status bar
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.ministatusline_disable = true -- Disable the original status line declared above

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'filename' },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
            },
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
