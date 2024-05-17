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
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    -- format_on_save = function(bufnr)
    --   -- Disable "format_on_save lsp_fallback" for languages that don't
    --   -- have a well standardized coding style. You can add additional
    --   -- languages here or re-enable it for the disabled ones.
    --   local disable_filetypes = { c = true, cpp = true }
    --   return {
    --     timeout_ms = 500,
    --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --   }
    -- end,
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
