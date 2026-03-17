-- ============================================================================
-- LSP Server Configurations
-- ============================================================================
-- Define language server settings here.
-- Each key is a server name, value is passed to lspconfig setup.
--
-- Available options:
--   - cmd: Override default command to start the server
--   - filetypes: Override default filetypes
--   - capabilities: Override capabilities
--   - settings: Server-specific settings
--
-- See `:help lspconfig-all` for all pre-configured servers.
-- ============================================================================

return {
  -- Lua Language Server
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },

  -- Python
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          typeCheckingMode = 'off',
          useLibraryCodeForTypes = false,
          exclude = {
            '**/__pycache__',
            '**/.git',
            '**/.mypy_cache',
            '**/.pytest_cache',
            '**/.ruff_cache',
            '**/.venv',
            '**/venv',
            '**/env',
            '**/node_modules',
            '**/build',
            '**/dist',
          },
        },
      },
    },
  },

  -- Add more servers here as needed:
  --
  -- TypeScript/JavaScript
  -- ts_ls = {},
  --
  -- Rust
  -- rust_analyzer = {},
  --
  -- Go
  -- gopls = {},
  --
  -- C/C++
  -- clangd = {},
}
