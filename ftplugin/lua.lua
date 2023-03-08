-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
   library = { plugins = { "nvim-dap-ui" }, types = true },
})
require("cmp_config")
require("lsp_config")
-- then setup your lsp server as usual
local lspconfig = require('lspconfig')
-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
   on_attach = require 'lsp_config'.on_attach,
   settings = {
      Lua = {
         completion = {
            callSnippet = "Replace"
         }
      }
   }
})
