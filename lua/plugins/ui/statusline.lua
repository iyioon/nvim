-- ============================================================================
-- Lualine - Statusline
-- ============================================================================
-- Enhanced statusline with mode, branch, diagnostics, and more.
-- https://github.com/nvim-lualine/lualine.nvim
-- ============================================================================

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Disable mini.statusline
      vim.g.ministatusline_disable = true

      -- Custom filename component with modified status colors
      local custom_fname = require('lualine.components.filename'):extend()
      local highlight = require 'lualine.highlight'
      local default_status_colors = { saved = '#5eff6c', modified = '#ff6e5e' }

      function custom_fname:init(options)
        custom_fname.super.init(self, options)
        self.status_colors = {
          saved = highlight.create_component_highlight_group(
            { fg = default_status_colors.saved },
            'filename_status_saved',
            self.options
          ),
          modified = highlight.create_component_highlight_group(
            { fg = default_status_colors.modified },
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
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_y = { 'progress' },
          lualine_z = {
            {
              'lsp_status',
              icon = '',
              symbols = {
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                done = '',
                separator = ' ',
              },
              ignore_lsp = { 'copilot' },
            },
          },
        },
      }
    end,
  },
}
