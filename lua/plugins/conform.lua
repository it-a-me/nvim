return {
  'stevearc/conform.nvim',
  lazy = true,
  keys = {
    { "<M-f>", function() require 'conform'.format() end, desc = 'Format Buffer' }
  },
  opts = {
    formatters_by_ft = {
      markdown = { "pandoc" }
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      pandoc = {
        command = "pandoc",
        args = { "--from", "gfm", "--to", "gfm" },
        inherit = false
      }
    }
  }
}
