vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }

require 'mini.icons'.setup {}
require 'mini.files'.setup {}

vim.keymap.set('n', '<leader>e', MiniFiles.open, { desc = "Open File Explorer" })

require 'mini.diff'.setup {
  view = {
    style = 'sign',
    signs = {
      add = '+',
      change = '~',
      delete = '-' },
  }
}

require 'mini.git'.setup {}
require 'mini.extra'.setup {}
require 'mini.statusline'.setup {}
require 'mini.notify'.setup {}

require 'mini_pick'
require 'mini_clues'
