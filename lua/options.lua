-- Set <leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd('set completeopt=menuone,noselect')

-- Show relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Always enable mouse
vim.opt.mouse = 'a'

-- Indent folded lines the same as their parents
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Enable smartcase for searches
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable full colors
vim.o.termguicolors = true

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
