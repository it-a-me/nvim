require "plugins"
require("mason").setup()
require("mason-lspconfig").setup {
   -- automatically install language servers setup below for lspconfig
   automatic_installation = true
}

vim.cmd('colorscheme everforest')
require("settings")
vim.keymap.set('n', '<Space>n', function() vim.cmd('Ntree') end)
vim.keymap.set('i', '<C-h>', function() vim.cmd('copilot-next') end)
vim.keymap.set('n', '<Space>tc', function() vim.cmd('tabnew') end)
vim.keymap.set('n', '<Space>tc', function() vim.cmd('tabnew') end)
vim.keymap.set('n', '<Space>c', function() vim.cmd('terminal') end)
vim.keymap.set('n', '<Space>sc', function() vim.cmd('below 18 split terminal | startinsert | terminal') end)
