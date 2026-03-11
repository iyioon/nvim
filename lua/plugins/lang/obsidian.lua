-- ============================================================================
-- Obsidian Integration
-- ============================================================================
-- Integration with Obsidian vaults for note-taking in Neovim.
-- Uses markdown links with relative paths for portability.
-- ============================================================================

return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- use latest release
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'saghen/blink.cmp',
      'nvim-telescope/telescope.nvim',
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = 'iyioon',
          path = '~/Documents/Obsidian/iyioon',
        },
      },

      -- Use markdown links [title](path.md) instead of wiki links [[title]]
      -- Use relative paths for portability
      link = {
        style = 'markdown',
        format = 'relative',
      },

      -- Use readable title slugs instead of zettelkasten IDs
      -- Converts "My Note Title" to "my-note-title"
      ---@param title string|nil
      ---@return string
      note_id_func = function(title)
        if title ~= nil then
          -- Transform title to lowercase slug with hyphens
          return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        end
        -- Fallback to timestamp if no title
        return tostring(os.time())
      end,

      -- Daily notes configuration
      daily_notes = {
        enabled = true,
        folder = '3_Areas/Calendar/All',
        date_format = 'YYYY-MM-DD',
        workdays_only = false, -- include weekends
      },

      -- Templates configuration
      templates = {
        enabled = true,
        folder = '4_Resources/Obsidian_Templates',
      },

      -- Custom frontmatter with created/modified timestamps
      frontmatter = {
        enabled = true,
        ---@param note obsidian.Note
        func = function(note)
          local out = {
            id = note.id,
            aliases = note.aliases,
            tags = note.tags,
          }

          -- Add created timestamp for new notes
          if note.metadata ~= nil and note.metadata.created then
            out.created = note.metadata.created
          else
            out.created = os.date '%Y-%m-%d %H:%M'
          end

          -- Always update modified timestamp
          out.modified = os.date '%Y-%m-%d %H:%M'

          -- Merge any other metadata
          if note.metadata ~= nil then
            for k, v in pairs(note.metadata) do
              if k ~= 'created' and k ~= 'modified' then
                out[k] = v
              end
            end
          end

          return out
        end,
        sort = { 'id', 'aliases', 'tags', 'created', 'modified' },
      },

      -- Use blink.cmp for completion
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
      },

      -- Use Telescope as picker
      picker = {
        name = 'telescope.nvim',
      },

      -- Disable UI enhancements (using render-markdown.nvim instead)
      ui = {
        enable = false,
      },

      -- Attachments saved relative to note in attachments/ folder
      attachments = {
        folder = './attachments',
      },

      -- Disable footer
      footer = {
        enabled = false,
      },

      -- Disable legacy commands (will be removed in 4.0.0)
      legacy_commands = false,
    },
  },
}
