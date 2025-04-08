return {
  'nvim-treesitter/nvim-treesitter',
  main = 'nvim-treesitter.configs',
  opts = {
    auto_install = true,
    ensure_installed = { "lua", "vim", "vimdoc" },
    highlight = {
      enable = true
    }
  }
}
