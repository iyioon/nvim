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

  -- Add more servers here as needed:
  --
  -- Python
  -- pyright = {},
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
