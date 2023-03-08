local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd("packadd packer.nvim")
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'neovim/nvim-lspconfig'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
   use 'folke/neodev.nvim'

   use 'github/copilot.vim'

   use 'williamboman/mason.nvim'
   use 'williamboman/mason-lspconfig.nvim'

   -- For vsnip users.
   use 'hrsh7th/cmp-vsnip'
   use 'hrsh7th/vim-vsnip'

   use 'https://github.com/morhetz/gruvbox'
   use 'https://github.com/dracula/vim'
   use 'https://github.com/sainnhe/everforest'
   use 'https://github.com/sainnhe/sonokai'

   -- rust
   use 'simrat39/rust-tools.nvim'

   -- rust-debuggingDebugging
   use 'nvim-lua/plenary.nvim'
   use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
      require('packer').sync()
   end
end)
