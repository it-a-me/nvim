return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    require('telescope').setup {
      extensions = {},
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = '[h]elp [h]elp' })
    vim.keymap.set('n', '<leader>hm', builtin.keymaps, { desc = '[h]elp key[m]aps' })
    vim.keymap.set('n', '<leader>hM', builtin.man_pages, { desc = '[h]elp [M]an pages' })
    vim.keymap.set('n', '<leader>ht', builtin.builtin, { desc = '[h]elp [t]elescope' })

    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search [F]iles' })
    vim.keymap.set('n', '<leader>e', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[B]uffers' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[B]uffers' })
  end,
}
