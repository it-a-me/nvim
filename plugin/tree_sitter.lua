vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter'
}
require 'nvim-treesitter'.install { "lua", "vim", "vimdoc" }

-- return {
--     {
--         "ravsii/tree-sitter-d2",
--         dependencies = { "nvim-treesitter/nvim-treesitter" },
--         version = "*", -- use the latest git tag instead of main
--           build = "make nvim-install",
--       },
--     {
--         main = 'nvim-treesitter.configs',
--       }
--   }
