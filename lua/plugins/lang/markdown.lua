-- ============================================================================
-- Markdown Support
-- ============================================================================
-- Markdown rendering and editing enhancements.
-- Note: Browser preview removed for server compatibility.
-- ============================================================================

return {
  -- Render markdown in buffer
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      require('render-markdown').setup {
        completions = { blink = { enabled = true } },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.keymap.set('n', '<leader>mr', '<cmd>RenderMarkdown toggle<CR>', { buffer = true, desc = 'Toggle [M]arkdown [R]ender' })
        end,
      })

      -- Enable linebreaks for markdown
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.opt_local.linebreak = true
        end,
      })
    end,
  },

  -- Auto-increment bullets
  { 'bullets-vim/bullets.vim' },
}
