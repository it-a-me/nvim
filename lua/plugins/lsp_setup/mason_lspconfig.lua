local setup_gopls = function()
  require 'lspconfig'.gopls.setup {
    settings = {
      gopls = {
        staticcheck = true,
        gofumpt = true,
        hints = {
          constantValues = true,
          assignVariableTypes = true,
          compositeLiteralFields = true,
        },
        codelenses = {
          test = true
        }
      }
    }
  }
end

return {
  "williamboman/mason-lspconfig.nvim",
  init = function()
    require("mason-lspconfig").setup {}
    require("mason-lspconfig").setup_handlers {
      function(server_name) -- default handler
        require("lspconfig")[server_name].setup {}
      end,
      gopls = setup_gopls
    }
  end
}
