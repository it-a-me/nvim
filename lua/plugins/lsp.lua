local mason = {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} }
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
  config = function()
    for name, _ in vim.fs.dir(vim.fn.stdpath('config') .. '/lua/lsp_overrides') do
      if #name > 4 and string.sub(name, -4) == '.lua' then
        local lsp_server = string.sub(name, 0, -5)
        vim.lsp.config(lsp_server,
          require('lsp_overrides' .. '.' .. lsp_server))
      end
    end
  end
}
