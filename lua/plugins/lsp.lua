local mason = {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} }
  },
  opts = {
    ensure_installed = {},
    handlers = {
      function(server_name) -- default handler
        vim.lsp.enable(server_name)
      end,
    }
  }
}

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    mason
  },
}
