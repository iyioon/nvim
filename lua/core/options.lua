-- ============================================================================
-- Core Options
-- ============================================================================
-- Neovim editor options and settings.
-- See `:help vim.o` and `:help option-list` for more information.
-- ============================================================================

-- Leader key (must be set before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd Font support
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse mode
vim.o.mouse = 'a'

-- Don't show mode (statusline shows it)
vim.o.showmode = false

-- Clipboard sync with OS (scheduled to avoid startup delay)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation
vim.o.breakindent = true

-- Undo history persistence
vim.o.undofile = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- UI settings
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Split behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.o.inccommand = 'split'

-- Cursor line highlighting
vim.o.cursorline = true

-- Scroll offset
vim.o.scrolloff = 10

-- Confirm unsaved changes on quit
vim.o.confirm = true

-- Spell checking (disabled by default)
vim.opt.spell = false
vim.opt.spelllang = { 'en_gb' }
