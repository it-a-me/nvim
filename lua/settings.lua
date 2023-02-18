--shortcut to vim options
local o = vim.opt;
o.shiftwidth = 3
o.expandtab = true;
o.background = "dark"
o.termguicolors = true
o.relativenumber = true;
vim.cmd('let mapleader = "<Space>"')
vim.cmd("filetype detect")
