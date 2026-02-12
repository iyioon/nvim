-- ============================================================================
-- GitHub Copilot
-- ============================================================================
-- AI-powered code suggestions.
-- https://github.com/zbirenbaum/copilot.lua
-- ============================================================================

return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('copilot').setup {
        panel = {
          auto_refresh = false,
          keymap = {
            accept = '<CR>',
            jump_prev = '[[',
            jump_next = ']]',
            refresh = 'gr',
            open = '<M-CR>',
          },
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
            prev = '<M-[>',
            next = '<M-]>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          ['*'] = true,
        },
      }

      vim.keymap.set('n', '<leader>tp', function()
        require('copilot.suggestion').toggle_auto_trigger()
        if vim.b.copilot_suggestion_auto_trigger == false then
          print('Copilot suggestions disabled')
        else
          print('Copilot suggestions enabled')
        end
      end, {
        noremap = true,
        silent = true,
        desc = '[T]oggle Co[p]ilot',
      })
    end,
  },
}
