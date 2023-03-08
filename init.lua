vim.cmd([[
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'folke/neodev.nvim'

Plug 'github/copilot.vim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

   Plug 'https://github.com/morhetz/gruvbox'
   Plug 'https://github.com/dracula/vim'
   Plug 'https://github.com/sainnhe/everforest'
   Plug 'https://github.com/sainnhe/sonokai'

   " rust
Plug 'simrat39/rust-tools.nvim'

" rust-debuggingDebugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
call plug#end()
]])

require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

vim.cmd('colorscheme everforest')
require("settings")
vim.keymap.set('n', '<Space>n', function() vim.cmd('Ntree')end)
vim.keymap.set('i', '<C-h>', function() vim.cmd('copilot-next')end)
vim.keymap.set('n', '<Space>tc', function() vim.cmd('tabnew')end)
vim.keymap.set('n', '<Space>tc', function() vim.cmd('tabnew')end)
vim.keymap.set('n', '<Space>c', function() vim.cmd('terminal')end)
vim.keymap.set('n', '<Space>sc', function() vim.cmd('below 18 split terminal | startinsert | terminal')end)
