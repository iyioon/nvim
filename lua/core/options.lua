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

-- Clipboard configuration
-- Use OSC 52 for SSH sessions (enables clipboard sync over SSH)
-- Otherwise use system clipboard
vim.schedule(function()
  if os.getenv 'SSH_TTY' then
    -- Force OSC 52 clipboard provider for SSH sessions
    -- This sends clipboard contents via terminal escape sequences
    -- Works with terminals that support OSC 52 (iTerm2, Alacritty, Kitty, WezTerm, etc.)
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy '+',
        ['*'] = require('vim.ui.clipboard.osc52').copy '*',
      },
      paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste '+',
        ['*'] = require('vim.ui.clipboard.osc52').paste '*',
      },
    }
  end
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation (defaults, guess-indent.nvim may override per-file)
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

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
