-- LaTeX related plugins and configurations
return {
  { -- Latex
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      -- PDF view settings
      vim.g.vimtex_view_method = 'skim'

      -- Compile settings
      vim.g.vimtex_compiler_method = 'latexmk'

      -- Don't open QuickFix for warnings
      vim.g.vimtex_quickfix_mode = 0

      -- Disable custom warnings based on regexp
      vim.g.vimtex_quickfix_ignore_filters = {
        'Underfull',
        'Overfull',
        'specifier changed to',
      }

      -- Disable default mappings
      vim.g.vimtex_mappings_enabled = 0

      -- Disable insert mode mappings (might interfere with other plugins)
      vim.g.vimtex_imaps_enabled = 0

      -- Enable completion
      vim.g.vimtex_complete_enabled = 1

      -- Configure keymaps for VimTeX
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'tex', 'latex' },
        callback = function()
          -- Compile document
          vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<CR>', { buffer = true, desc = 'Compile LaTeX' })
          -- View PDF
          vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', { buffer = true, desc = 'View PDF' })
          -- Forward search
          vim.keymap.set('n', '<leader>ls', '<cmd>VimtexForwardSearch<CR>', { buffer = true, desc = 'Forward search' })
          -- Clean auxiliary files
          vim.keymap.set('n', '<leader>lc', '<cmd>VimtexClean<CR>', { buffer = true, desc = 'Clean auxiliary files' })
          -- Show compile errors
          vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>', { buffer = true, desc = 'Show errors' })
          -- Toggle main/included files
          vim.keymap.set('n', '<leader>lt', '<cmd>VimtexToggleMain<CR>', { buffer = true, desc = 'Toggle main file' })
        end,
      })
    end,
  },

  { -- Snippets for LaTeX
    'iurimateus/luasnip-latex-snippets.nvim',
    ft = { 'tex', 'latex' },
    dependencies = { 
      'L3MON4D3/LuaSnip',
      'lervag/vimtex' 
    },
    config = function()
      require('luasnip-latex-snippets').setup()
      require('luasnip').config.setup { enable_autosnippets = true }
    end,
  },
}