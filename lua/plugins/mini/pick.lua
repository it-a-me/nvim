require 'mini.pick'.setup {}

local ws_root = function()
  if MiniGit.get_buf_data(0) ~= nil then
    return { source = { cwd = MiniGit.get_buf_data(0).root } }
  else
    return {}
  end
end

vim.keymap.set('n', '<leader>b', MiniPick.builtin.buffers, { desc = "Open Buffers" })

vim.keymap.set('n', '<leader>f',
  function()
    MiniPick.builtin.files({}, ws_root())
  end,
  { desc = 'Find Files' })

vim.keymap.set('n', '<leader>wg',
  function()
    MiniPick.builtin.grep_live({}, ws_root())
  end,
  { desc = "Workspace Grep" })

vim.keymap.set('n', '<leader>hh', MiniPick.builtin.help, { desc = 'Help' })
vim.keymap.set('n', '<leader>hc', MiniExtra.pickers.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>hk', MiniExtra.pickers.keymaps, { desc = 'Keymaps' })
