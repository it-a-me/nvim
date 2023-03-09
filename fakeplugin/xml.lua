require("cmp_config")
require("lsp_config")
-- then setup your lsp server as usual
-- example to setup lua_ls and enable call snippets
require'lspconfig'.lemminx.setup({
   on_attach = require 'lsp_config'.on_attach,
})
