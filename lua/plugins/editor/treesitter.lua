-- ============================================================================
-- Treesitter
-- ============================================================================
-- Syntax highlighting, indentation, and code understanding.
-- https://github.com/nvim-treesitter/nvim-treesitter
-- ============================================================================

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'query',
          'vim',
          'vimdoc',
        },
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(_, buf)
            -- Disable for large files
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
            return false
          end,
        },
        indent = { enable = true },
      }
    end,
  },

  -- Treesitter Context - Shows code context at top of buffer
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPre',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
      zindex = 20,
      separator = nil,
    },
    config = function(_, opts)
      require('treesitter-context').setup(opts)

      vim.keymap.set('n', '<leader>tc', function()
        require('treesitter-context').toggle()
      end, { desc = '[T]oggle [C]ontext' })

      vim.cmd [[
        hi TreesitterContextLineNumberBottom gui=underline guisp=Grey
        hi TreesitterContext guibg=NONE
      ]]
    end,
  },
}
