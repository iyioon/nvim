-- ============================================================================
-- LSP Configuration
-- ============================================================================
-- Language Server Protocol configuration with Mason for auto-installation.
-- https://github.com/neovim/nvim-lspconfig
-- ============================================================================

return {
  -- Lazydev for Neovim Lua development
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- Mason - Package manager for LSP servers, DAP, linters, formatters
  {
    'mason-org/mason.nvim',
    opts = {},
  },

  -- Mason LSP Config - Bridges mason.nvim with lspconfig
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      -- Automatically enable installed servers via vim.lsp.enable()
      automatic_enable = true,
    },
  },

  -- Mason Tool Installer - Auto-install LSP servers, formatters, linters
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP servers
        'lua-language-server', -- Lua (Neovim config)
        'clangd', -- C/C++
        'css-lsp', -- CSS
        'html-lsp', -- HTML
        'jdtls', -- Java
        'marksman', -- Markdown
        'pyright', -- Python
        'typescript-language-server', -- TypeScript/JavaScript
        'rust-analyzer', -- Rust

        -- Formatters
        'stylua', -- Lua formatter
        'prettier', -- JS/TS/CSS/HTML/JSON/Markdown formatter
      },
    },
  },

  -- Fidget - LSP progress notifications
  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        window = {
          winblend = 0,
          relative = 'editor',
        },
      },
    },
  },

  -- Main LSP configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      -- Load server configurations
      local servers = require 'config.lsp_servers'

      -- LSP capabilities with blink.cmp
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Configure each server using vim.lsp.config (Neovim 0.11+)
      for server_name, server_config in pairs(servers) do
        server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})
        vim.lsp.config[server_name] = server_config
      end

      -- LSP attach autocommand
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- LSP keymaps
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- Document highlight
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- Inlay hints toggle
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            return diagnostic.message
          end,
        },
      }
    end,
  },
}
