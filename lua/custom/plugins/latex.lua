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

      -- Inserting template files for latex
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'tex', 'latex' },
        callback = function()
          vim.keymap.set('n', '<leader>nt', function()
            local template_dir = vim.fn.expand '~/.config/nvim/snippets/templates/latex'

            require('telescope.builtin').find_files {
              prompt_title = 'LaTeX Templates',
              cwd = template_dir,
              attach_mappings = function(_, map)
                map('i', '<CR>', function(prompt_bufnr)
                  -- Get selected file
                  local selection = require('telescope.actions.state').get_selected_entry()
                  require('telescope.actions').close(prompt_bufnr)

                  if selection then
                    -- Read file content
                    local file = io.open(selection.path, 'r')
                    if not file then
                      return
                    end

                    local content = file:read '*all'
                    file:close()

                    -- Wait briefly after closing telescope
                    vim.defer_fn(function()
                      -- Ensure buffer is modifiable
                      local bufnr = vim.api.nvim_get_current_buf()
                      local was_modifiable = vim.bo[bufnr].modifiable
                      vim.bo[bufnr].modifiable = true

                      -- Split content and replace buffer
                      local lines = {}
                      for line in content:gmatch '[^\r\n]+' do
                        table.insert(lines, line)
                      end

                      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

                      -- Restore modifiable
                      vim.bo[bufnr].modifiable = was_modifiable
                    end, 100) -- Small delay to ensure telescope is fully closed
                  end
                end)
                return true
              end,
            }
          end, { buffer = true, desc = 'Pick LaTeX template' })
        end,
      })

      -- Compile LaTeX files on save
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'tex', 'latex' },
        callback = function()
          -- Create a buffer-local autocmd for BufWritePost
          vim.api.nvim_create_autocmd('BufWritePost', {
            buffer = 0, -- 0 means current buffer
            callback = function()
              -- Check if VimTeX compilation is already running
              local vimtex_data = vim.b.vimtex
              if vimtex_data and vimtex_data.compiler and not vimtex_data.compiler.is_running then
                -- If not running, start compilation
                vim.cmd 'VimtexCompile'
              end
            end,
            desc = 'Compile LaTeX on save',
          })

          -- Let the user know this feature is enabled
          -- vim.notify('Auto-compile on save enabled for LaTeX', vim.log.levels.INFO)
        end,
      })

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
      'lervag/vimtex',
    },
    config = function()
      require('luasnip-latex-snippets').setup()
      require('luasnip').config.setup { enable_autosnippets = true }
    end,
  },
}

