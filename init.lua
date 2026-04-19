-- Entry point for the Neovim configuration.
--
-- Runtime layout:
--   lua/core/     editor options, keymaps, autocmds, plugin bootstrap
--   lua/config/   shared configuration data
--   lua/plugins/  lazy.nvim plugin specs grouped by concern
--
-- See README.md for installation notes, keymaps, and structure.

-- Load core configuration modules
require 'core.options'
require 'core.keymaps'
require 'core.autocmds'
require 'core.lazy'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
