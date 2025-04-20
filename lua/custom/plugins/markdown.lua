-- Markdown related plugins and configurations
return {
  { -- Markdown Preview
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },

    -- Configure keymaps for Markdown Preview - only applied to markdown files
    config = function()
      -- Create buffer-local keymaps that only apply to markdown files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { buffer = true, desc = 'Markdown Preview' })
          vim.keymap.set('n', '<leader>mP', '<cmd>MarkdownPreviewStop<CR>', { buffer = true, desc = 'Stop Markdown Preview' })
          vim.keymap.set('n', '<leader>mR', '<cmd>MarkdownPreview<CR>', { buffer = true, desc = 'Refresh Markdown Preview' })
        end,
      })
    end,
  },
}
