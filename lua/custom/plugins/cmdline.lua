-- Command line UI customization
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      "rcarriga/nvim-notify", -- For fancy notifications
    },
    opts = {
      cmdline = {
        enabled = true, -- Enable cmdline customization
        view = "cmdline_popup", -- Options: cmdline, cmdline_popup, cmdline_popupmenu
        format = {
          -- Customize cmdline format for different command types
          cmdline = { icon = ">" },
          search_down = { icon = "🔍⌄" },
          search_up = { icon = "🔍⌃" },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "?" },
        },
      },
      -- Message display options
      messages = {
        enabled = true,
        view = "notify", -- Options: notify, mini, virtualtext, split
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages", 
        view_search = "virtualtext",
      },
      -- Customize how Vim's regular UI components appear
      views = {
        cmdline_popup = {
          position = {
            row = "50%", 
            col = "50%",
          },
          size = {
            width = "60%",
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 1, 2 },
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = "60%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 1, 2 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      -- You can disable features you don't use
      routes = {
        -- Hide written messages like "written file..."
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
      -- Set to false to disable a feature completely
      lsp = {
        -- Override markdown rendering so that **cmp** and other plugins use Treesitter
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
      },
      -- Set this to false if you don't want the nice LSP progress UI
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
      
      -- Add keymaps for command history
      vim.keymap.set("n", "<leader>cn", function()
        require("noice").cmd("history")
      end, { desc = "Noice Command History" })
      
      -- Toggle Noice (for troubleshooting or temporarily disabling)
      vim.keymap.set("n", "<leader>ct", function()
        require("noice").cmd("toggle")
      end, { desc = "Toggle Noice" })
      
      -- Last notification message
      vim.keymap.set("n", "<leader>cl", function()
        require("noice").cmd("last")
      end, { desc = "Noice Last Message" })
      
      -- Last error message
      vim.keymap.set("n", "<leader>ce", function()
        require("noice").cmd("errors")
      end, { desc = "Noice Errors" })
    end
  },
}