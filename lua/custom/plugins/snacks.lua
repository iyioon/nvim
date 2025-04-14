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
        -- Default configuration for dim (initially disabled)
        -- See below for the toggle mechanism during insert mode
        enabled = false,
        animate = {
          duration = {
            step = 2,
            total = 300,
          },
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
    end,
  },
}
