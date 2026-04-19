return {
  {
    "ravsii/tree-sitter-d2",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    version = "*", -- use the latest git tag instead of main
    build = "make nvim-install",
  },
  {
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
}
