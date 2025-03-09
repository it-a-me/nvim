require 'lazy_setup'
require 'options'
require 'lsp'

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
})
