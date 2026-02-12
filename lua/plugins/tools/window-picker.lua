-- ============================================================================
-- Window Picker
-- ============================================================================
-- Easily select which window to open a file in.
-- https://github.com/s1n7ax/nvim-window-picker
-- ============================================================================

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

      vim.keymap.set('n', '<leader>wp', function()
        local win = require('window-picker').pick_window()
        if win then
          vim.api.nvim_set_current_win(win)
        end
      end, {
        desc = '[W]indow [P]ick',
        noremap = true,
        silent = true,
      })
    end,
  },
}
