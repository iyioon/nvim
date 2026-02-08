-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- This file imports all custom plugin modules
return {
  -- Import all plugins organized by category
  { import = 'custom.plugins.ui' }, -- UI-related plugins (statusline, colorscheme, etc.)
  { import = 'custom.plugins.latex' }, -- LaTeX-related plugins
  { import = 'custom.plugins.markdown' }, -- Markdown-related plugins
  { import = 'custom.plugins.utils' }, -- Utility plugins (file explorer, terminal, etc.)
  { import = 'custom.plugins.snacks' }, -- Quality of life plugins
  { import = 'custom.plugins.zen' }, -- Distraction-free coding
  { import = 'custom.plugins.file-explorer' },
  { import = 'custom.plugins.terminal' },
  { import = 'custom.plugins.fold' },
  { import = 'custom.plugins.colorpicker' },
}
