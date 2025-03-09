require 'mini.pick'.setup {}
vim.keymap.set('n', '<leader>f', function()
  if MiniGit.get_buf_data(0) ~= nil then
    MiniPick.builtin.files({}, { source = { cwd = MiniGit.get_buf_data(0).root } })
  else
    MiniPick.builtin.files()
  end
end)

vim.keymap.set('n', '<leader>b', MiniPick.builtin.buffers, { desc = "Open Buffers" })
vim.keymap.set('n', '<leader>g', MiniPick.builtin.grep_live, { desc = "Live Grep" })

vim.keymap.set('n', '<leader>hh', MiniPick.builtin.help, { desc = 'Help' })
vim.keymap.set('n', '<leader>hc', MiniExtra.pickers.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>hk', MiniExtra.pickers.keymaps, { desc = 'Keymaps' })
