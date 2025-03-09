return {
  'echasnovski/mini.nvim',
  version = false,
  init = function()
    require 'mini.icons'.setup {}

    require 'mini.files'.setup {}
    vim.keymap.set('n', '<leader>e', MiniFiles.open, { desc = "Open File Explorer" })

    require 'mini.git'.setup {}

    require 'mini.extra'.setup {}
    require 'plugins.mini.pick'

    require 'mini.statusline'.setup {}
    require 'mini.notify'.setup {}

    require 'plugins.mini.clues'
  end
}
