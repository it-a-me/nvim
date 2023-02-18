vim.cmd([[
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'folke/neodev.nvim'

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
vim.cmd('colorscheme everforest')
require("settings")
vim.keymap.set('n', '<Space>t', function() vim.cmd('Ntree')end)
