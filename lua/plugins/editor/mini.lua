-- ============================================================================
-- Mini.nvim
-- ============================================================================
-- Collection of small independent plugins/modules.
-- https://github.com/echasnovski/mini.nvim
-- ============================================================================

return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup {
        n_lines = 500,
        mappings = {
          -- Keep Neovim 0.12 builtin incremental selection on `an` / `in`.
          around_next = '',
          inside_next = '',
        },
      }
    end,
  },

  -- Mini surround (separate for better lazy loading)
  {
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',
      },
    },
  },
}
