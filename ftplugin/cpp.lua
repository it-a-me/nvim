require("cmp_config")
require("lsp_config")

require'lspconfig'.clangd.setup({
   on_attach = require 'lsp_config'.on_attach,
   vim.keymap.set('n', '<Space>ah', function() vim.cmd("ClangdSwitchSourceHeader") end),

})


