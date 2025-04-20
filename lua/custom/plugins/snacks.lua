-- Quality of Life plugins from snacks.nvim collection
return {
  {
    'folke/snacks.nvim',
    --@type snacks.Config
    priority = 1000, -- Load early
    lazy = false, -- Don't lazy load
    opts = {
      -- Enable only the snacks plugins you want to use
      indent = { enabled = true },

      scroll = {
        enabled = true,
        animate = {
          duration = { step = 5, total = 250 },
          easing = 'outQuad',
        },
      },

      dim = {
        -- See below for the toggle mechanism during insert mode
        enabled = false,

        animate = {
          duration = {
            step = 2,
            total = 300,
          },
        },
        -- Only dim the current active buffer
        filter = function(buf)
          -- Check if this buffer is the current active buffer
          local is_current_buffer = buf == vim.api.nvim_get_current_buf()

          -- Keep other standard checks but only allow dimming for current buffer
          return is_current_buffer and vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ''
        end,
      },

      lazygit = {
        enabled = true,
        -- your lazygit configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
        -- configure = true,  -- Auto-configure with current colorscheme
        config = {
          os = { editPreset = 'nvim-remote' }, -- Allow editing files in your current Neovim instance
          gui = {
            nerdFontsVersion = '3', -- Use Nerd Font icons (set to "" to disable icons)
          },
        },
        win = {
          style = 'lazygit', -- Use the predefined lazygit window style
        },
      },

      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
        },
        -- Check https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=LAZYVIM
        -- for generating ASCII art
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
          header = [[
░   ░░░  ░░        ░░░      ░░░  ░░░░  ░░        ░░  ░░░░  ░
▒    ▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒   ▒▒   ▒
▓  ▓  ▓  ▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓▓  ▓▓  ▓▓▓▓▓▓  ▓▓▓▓▓        ▓
█  ██    ██  ████████  ████  ████    ███████  █████  █  █  █
█  ███   ██        ███      ██████  █████        ██  ████  █
          ]],
        },
      },
    },

    config = function(_, opts)
      -- Load the plugin with options
      require('snacks').setup(opts)

      -- Change header color
      vim.api.nvim_set_hl(0, 'SnacksDashboardHeader', { fg = '#7b8496' })

      -- Set up autocommands to toggle dim based on insert mode
      vim.api.nvim_create_autocmd('InsertEnter', {
        callback = function()
          require('snacks').dim.enable()
        end,
        desc = 'Enable dim when entering insert mode',
      })

      vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
          require('snacks').dim.disable()
        end,
        desc = 'Disable dim when leaving insert mode',
      })
      -- LazyGit keybindings
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
