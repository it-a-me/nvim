return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    { "<M-f>", function() require 'conform'.format() end, desc = 'Format Buffer' }
  },
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      pandoc = {
        command = "pandoc",
        args = {
          "--from", "markdown",
          "--standalone", -- Support metadata blocks
          "--to", "markdown-simple_tables"
        },
        stdin = true,
      }
    },
    formatters_by_ft = {
      markdown = { "pandoc" }
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    -- This setup call registers the formatters defined in 'opts'
    conform.setup(opts)
  end,
}
