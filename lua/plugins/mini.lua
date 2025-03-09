return {
  'echasnovski/mini.nvim',
  version = false,
  init = function()
    require 'mini.icons'.setup {}

    require 'mini.files'.setup {}
    vim.keymap.set('n', '<leader>e', MiniFiles.open)

    require('mini.pick').setup()
    vim.keymap.set('n', '<leader>f', MiniPick.builtin.files)
    vim.keymap.set('n', '<leader>b', MiniPick.builtin.buffers)
    vim.keymap.set('n', '<leader>h', MiniPick.builtin.help)
  end
}
