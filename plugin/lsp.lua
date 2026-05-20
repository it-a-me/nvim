vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
}
require 'mason'.setup {}
require 'mason-lspconfig'.setup {
  ensure_installed = {},
  handlers = {
    function(server_name) -- default handler
      vim.lsp.enable(server_name)
    end,
  }
}
