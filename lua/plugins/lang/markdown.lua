-- ============================================================================
-- Markdown Support
-- ============================================================================
-- Markdown preview, rendering, and editing enhancements.
-- ============================================================================

return {
  -- Markdown Preview in browser
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { buffer = true, desc = 'Toggle [M]arkdown [P]review' })
        end,
      })
    end,
  },

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
