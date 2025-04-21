-- UI related plugins: status line, color scheme, etc.
return {
  { -- Cyberdream colorscheme with custom contrast and transparency
    'scottmckendry/cyberdream.nvim',
    priority = 1000, -- Ensure it loads before other UI plugins
    lazy = false, -- Load this plugin at startup
    config = function()
      require('cyberdream').setup {
        saturation = 0.8, -- Set to a value less than 1.0 for slightly less contrast
        transparent = true,
      }
      vim.cmd.colorscheme 'cyberdream'

      -- Custom light purple Visual highlight
      vim.api.nvim_set_hl(0, 'Visual', {
        bg = '#7f3aa0',
        fg = 'NONE', -- Keep text color the same
        blend = 20, -- Add some transparency
      })

      -- Further Customizations to match the theme
      -- Custom line number
      -- vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2e2a35' }) -- Enable for a custom CursorLine highlight
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#707889' })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#707889' })
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ff5ef1' })

      vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#7f3aa0', fg = '#ffffff', bold = true }) -- Highlight matching parentheses

      -- Matching file

      -- Custom curosr and TelescopeSelection highlight
      vim.o.cursorline = false -- Disable CursorLine highlight
      vim.o.guicursor = 'n-v-c:block-Cursor,i:ver25-CursorInsert'
      vim.api.nvim_set_hl(0, 'Cursor', { bg = '#ff5ef1' })
      vim.api.nvim_set_hl(0, 'CursorInsert', { bg = '#ff5ef1' })
      vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#7f3aa0' })
    end,
  },

  { -- Status bar
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.ministatusline_disable = true -- Disable the original status line declared above

      -- Changing filename color based on modified status
      local custom_fname = require('lualine.components.filename'):extend()
      local highlight = require 'lualine.highlight'
      local default_status_colors = { saved = '#5eff6c', modified = '#ff6e5e' }

      function custom_fname:init(options)
        custom_fname.super.init(self, options)
        self.status_colors = {
          saved = highlight.create_component_highlight_group(
            { fg = default_status_colors.saved }, -- Changed bg to fg here
            'filename_status_saved',
            self.options
          ),
          modified = highlight.create_component_highlight_group(
            { fg = default_status_colors.modified }, -- Changed bg to fg here
            'filename_status_modified',
            self.options
          ),
        }
        if self.options.color == nil then
          self.options.color = ''
        end
      end

      function custom_fname:update_status()
        local data = custom_fname.super.update_status(self)
        data = highlight.component_format_highlight(vim.bo.modified and self.status_colors.modified or self.status_colors.saved) .. data
        return data
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { custom_fname },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
            },
          },
          lualine_y = { 'progress' },
          lualine_z = {
            {
              'lsp_status',
              icon = '', -- f013
              symbols = {
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                -- Standard unicode symbol for when LSP is done:
                done = '',
                -- Delimiter inserted between LSP names:
                separator = ' ',
              },
              -- List of LSP names to ignore (e.g., `null-ls`):
              ignore_lsp = { 'GitHub Copilot' },
            },
          },
        },
      }
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
