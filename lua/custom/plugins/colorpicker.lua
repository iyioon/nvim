-- Color picker plugin using ccc.nvim
-- Create Color Code in neovim with colorful sliders
return {
  {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    config = function()
      local ccc = require('ccc')

      ccc.setup({
        -- Highlighter settings - auto highlight colors in buffers
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        -- Use background highlighting for colors
        highlight_mode = 'bg',
        -- Input color spaces
        inputs = {
          ccc.input.rgb,
          ccc.input.hsl,
          ccc.input.cmyk,
        },
        -- Output formats
        outputs = {
          ccc.output.hex,
          ccc.output.hex_short,
          ccc.output.css_rgb,
          ccc.output.css_hsl,
        },
        -- Pickers for detecting colors
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
        -- Conversion rules for :CccConvert
        convert = {
          { ccc.picker.hex, ccc.output.css_rgb },
          { ccc.picker.css_rgb, ccc.output.css_hsl },
          { ccc.picker.css_hsl, ccc.output.hex },
        },
      })

      -- Keymaps
      vim.keymap.set('n', '<leader>cp', '<cmd>CccPick<cr>', { desc = '[C]olor [P]icker' })
      vim.keymap.set('n', '<leader>cc', '<cmd>CccConvert<cr>', { desc = '[C]olor [C]onvert' })
      vim.keymap.set('n', '<leader>ch', '<cmd>CccHighlighterToggle<cr>', { desc = '[C]olor [H]ighlighter Toggle' })
    end,
  },
}
