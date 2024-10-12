require 'options'
require 'keymaps'
require 'au_commands'

-- initialize lazy
require 'plugins/lazy'

require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'plugins/gitsigns',

  require 'plugins/which_key',

  require 'plugins/telescope',

  require 'plugins/lsp_config',

  require 'plugins/conform',

  require 'plugins/cmp',

  require 'plugins/mini',

  require 'plugins/treesitter',

  -- themes
  {
    'neanias/everforest-nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

})

vim.api.nvim_create_user_command("Test", function()
  if vim.b.Test ~= nil then
    vim.b.Test()
  else
    print("no tests available")
  end
end, { desc = "Run Tests" })

vim.api.nvim_create_user_command("Lint", function()
  if vim.b.Lint ~= nil then
    vim.b.Lint()
  else
    print("no tests available")
  end
end, { desc = "Run Linter" })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
