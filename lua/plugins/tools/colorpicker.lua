-- ============================================================================
-- Color Picker
-- ============================================================================
-- CCC.nvim for creating and editing color codes.
-- https://github.com/uga-rosa/ccc.nvim
-- ============================================================================

return {
  {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    config = function()
      local ccc = require 'ccc'

      ccc.setup {
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        highlight_mode = 'bg',
        inputs = {
          ccc.input.rgb,
          ccc.input.hsl,
          ccc.input.cmyk,
        },
        outputs = {
          ccc.output.hex,
          ccc.output.hex_short,
          ccc.output.css_rgb,
          ccc.output.css_hsl,
        },
        pickers = {
          ccc.picker.hex,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.css_hwb,
          ccc.picker.css_lab,
          ccc.picker.css_lch,
          ccc.picker.css_oklab,
          ccc.picker.css_oklch,
        },
        convert = {
          { ccc.picker.hex, ccc.output.css_rgb },
          { ccc.picker.css_rgb, ccc.output.css_hsl },
          { ccc.picker.css_hsl, ccc.output.hex },
        },
      }

      vim.keymap.set('n', '<leader>cp', '<cmd>CccPick<cr>', { desc = '[C]olor [P]icker' })
      vim.keymap.set('n', '<leader>cc', '<cmd>CccConvert<cr>', { desc = '[C]olor [C]onvert' })
      vim.keymap.set('n', '<leader>ch', '<cmd>CccHighlighterToggle<cr>', { desc = '[C]olor [H]ighlighter Toggle' })
    end,
  },
}
