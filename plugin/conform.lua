vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require 'conform'.setup {
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
}

vim.keymap.set('n', '<A-f>', require 'conform'.format)
