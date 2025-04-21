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
          vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { buffer = true, desc = 'Toggle [M]arkdown [P]review' })
        end,
      })
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},

    -- Configure keymaps for Render Markdown - only applied to markdown files
    config = function()
      -- Enable completions for Render Markdown
      require('render-markdown').setup {
        completions = { blink = { enabled = true } },
      }
      -- Create buffer-local keymaps that only apply to markdown files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.keymap.set('n', '<leader>mr', '<cmd>RenderMarkdown toggle<CR>', { buffer = true, desc = 'Toggle [M]arkdown [R]ender' })
        end,
      })
    end,
  },

  -- Auto Increment bullets
  {
    'bullets-vim/bullets.vim',
  },
}
