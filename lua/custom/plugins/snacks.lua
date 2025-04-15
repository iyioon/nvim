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

      zen = {
        enabled = true,
        toggles = {
          dim = false,
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
          header = [[
           ▄█  ▄██   ▄    ▄█   ▄██████▄   ▄██████▄  
███  ███   ██▄ ███  ███    ███ ███    ███ ███▀▀▀██▄ 
███▌ ███▄▄▄███ ███▌ ███    ███ ███    ███ ███   ███ 
███▌ ▀▀▀▀▀▀███ ███▌ ███    ███ ███    ███ ███   ███ 
███▌ ▄██   ███ ███▌ ███    ███ ███    ███ ███   ███ 
███  ███   ███ ███  ███    ███ ███    ███ ███   ███ 
███  ███   ███ ███  ███    ███ ███    ███ ███   ███ 
█▀    ▀█████▀  █▀    ▀██████▀   ▀██████▀   ▀█   █▀  

          ]],
        },
      },
    },

    config = function(_, opts)
      -- Load the plugin with options
      require('snacks').setup(opts)

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

      -- keybind to toggle zen mode
      local zen_active = false
      vim.keymap.set('n', '<leader>tz', function()
        require('snacks').zen.zen()
      end, { desc = '[T]oggle [Z]en mode' })
    end,
  },
}
