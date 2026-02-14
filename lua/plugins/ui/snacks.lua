-- ============================================================================
-- Snacks.nvim
-- ============================================================================
-- Collection of QoL plugins: indent, scroll, dim, dashboard, images, lazygit.
-- https://github.com/folke/snacks.nvim
-- ============================================================================

local header = table.concat({
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
}, '\n')

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- Image viewer (disabled for server - requires graphical terminal)
      image = { enabled = false },

      -- Indent guides
      indent = { enabled = true },

      -- Smooth scrolling
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 5, total = 250 },
          easing = 'outQuad',
        },
      },

      -- Dim inactive lines (disabled by default)
      dim = {
        enabled = false,
        animate = {
          duration = { step = 2, total = 300 },
        },
        filter = function(buf)
          local is_current_buffer = buf == vim.api.nvim_get_current_buf()
          return is_current_buffer and vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ''
        end,
      },

      -- LazyGit integration
      lazygit = {
        enabled = true,
        config = {
          os = { editPreset = 'nvim-remote' },
          gui = { nerdFontsVersion = '3' },
        },
        win = { style = 'lazygit' },
      },

      -- Dashboard
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
        },
        preset = {
          keys = {
            { icon = '󰈞 ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = '󰈔 ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = '󰊄 ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = '󰄉 ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = '󰒓 ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = '󰩈 ', key = 'q', desc = 'Quit', action = ':qa' },
          },
          header = header,
        },
      },

      -- Dashboard window style (hide end-of-buffer tildes)
      styles = {
        dashboard = {
          wo = {
            fillchars = 'eob: ',
          },
        },
      },
    },
    config = function(_, opts)
      require('snacks').setup(opts)

      -- LazyGit keymaps
      vim.keymap.set('n', '<leader>gg', function()
        require('snacks').lazygit.open()
      end, { desc = 'Open LazyGit' })
      vim.keymap.set('n', '<leader>gl', function()
        require('snacks').lazygit.log()
      end, { desc = 'Open LazyGit log view' })
      vim.keymap.set('n', '<leader>gf', function()
        require('snacks').lazygit.log_file()
      end, { desc = 'Open LazyGit file history' })
    end,
  },
}
