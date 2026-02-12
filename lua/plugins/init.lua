-- ============================================================================
-- Plugin Specifications
-- ============================================================================
-- Main entry point for all plugin specifications.
-- Plugins are organized into subdirectories by category:
--
--   lua/plugins/
--   ├── init.lua          -- This file (imports all categories)
--   ├── editor/           -- Core editor enhancements
--   │   ├── treesitter.lua
--   │   ├── telescope.lua
--   │   ├── completion.lua
--   │   ├── mini.lua
--   │   └── ...
--   ├── lsp/              -- Language Server Protocol
--   │   ├── init.lua      -- LSP configuration
--   │   └── conform.lua   -- Formatting
--   ├── ui/               -- User interface
--   │   ├── colorscheme.lua
--   │   ├── statusline.lua
--   │   └── ...
--   ├── lang/             -- Language-specific plugins
--   │   ├── markdown.lua
--   │   └── ...
--   └── tools/            -- Development tools
--       ├── git.lua
--       ├── file-explorer.lua
--       └── ...
--
-- Each file should return a table of lazy.nvim plugin specs.
-- See `:help lazy.nvim-lazy.nvim-plugin-spec` for specification format.
-- ============================================================================

return {
  -- Import all plugin categories
  { import = 'plugins.editor' },
  { import = 'plugins.lsp' },
  { import = 'plugins.ui' },
  { import = 'plugins.lang' },
  { import = 'plugins.tools' },
}
