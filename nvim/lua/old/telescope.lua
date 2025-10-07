local actions = require "telescope.actions"

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-v>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-t>"] = actions.select_tab,
      },

      n = {
        ["<C-v>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-t>"] = actions.select_tab,
      }
    },

    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_ignore_patterns = {
      '%.git/', 'node_modules/', '%.npm/', '__pycache__/', '%[Cc]ache/',
      '%.dropbox/', '%.dropbox_trashed/', '%.local/share/Trash/',
      '%.py[c]', '%.sw.?', '~$', '%.tags', '%.gemtags', '%.tmp',
      '%.plist$', '%.class$' 
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
