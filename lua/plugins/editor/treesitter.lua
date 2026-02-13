-- ============================================================================
-- Treesitter
-- ============================================================================
-- Syntax highlighting, indentation, and code understanding.
-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- NOTE: This uses the new nvim-treesitter API (main branch, 2024+).
-- The old API using require('nvim-treesitter.configs') is deprecated.
-- ============================================================================

-- Parsers to install
local ensure_installed = {
  'bash', -- Shell scripts
  'c', -- C language (also helps with many parsers)
  'diff', -- Git diff output
  'html', -- HTML files
  'lua', -- Lua (Neovim config)
  'luadoc', -- Lua documentation comments
  'markdown', -- Markdown files
  'markdown_inline', -- Inline markdown (code blocks, etc.)
  'python', -- Python
  'query', -- Treesitter query files
  'vim', -- Vimscript
  'vimdoc', -- Vim help files
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- Use new API (main branch)
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Setup nvim-treesitter (new API)
      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath 'data' .. '/site',
      }

      -- Install parsers (async, no-op if already installed)
      require('nvim-treesitter').install(ensure_installed)

      -- Enable treesitter highlighting for all filetypes
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
        callback = function(args)
          -- Skip large files (>100KB)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end

          -- Start treesitter highlighting if parser exists
          pcall(vim.treesitter.start)
        end,
      })

      -- Enable treesitter-based indentation
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-indent', { clear = true }),
        callback = function()
          pcall(function()
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end)
        end,
      })
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
