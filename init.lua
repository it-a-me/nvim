require "plugins"
require 'vim_lsp'



vim.cmd([[filetype on]])
vim.cmd('colorscheme everforest')
require("settings")
vim.keymap.set('n', '<Space>n', function() vim.cmd('Ntree') end)
vim.keymap.set('i', '<C-h>', function() vim.cmd('copilot-next') end)
vim.keymap.set('n', '<Space>tc', function() vim.cmd('tabnew') end)
vim.keymap.set('n', '<Space>tc', function() vim.cmd('tabnew') end)
vim.keymap.set('n', '<Space>c', function() vim.cmd('terminal') end)
vim.keymap.set('n', '<Space>sc', function() vim.cmd('below 18 split terminal | startinsert | terminal') end)

vim.keymap.set('n', '<Space>db', function() vim.cmd("DapToggleBreakpoint") end)
vim.keymap.set('n', '<Space>dc', function() vim.cmd("DapContinue") end)
