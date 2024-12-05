return { -- Autoformat
  'stevearc/conform.nvim',
  -- enable if format on stave is enabled
  --event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      '<A-f>',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    formatters = {
      pandoc_gfm = {
        inherit = false,
        command = 'pandoc',
        args = { "--from", "gfm", "--to", "gfm" },
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      markdown = { 'pandoc_gfm' },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
