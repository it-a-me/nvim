-- Univeral
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Normal Mode

-- format code
vim.keymap.set('n', "<A-f>", "<cmd>Autofmt<CR>", {})
-- file browser
vim.keymap.set('n', "<leader>f", "<cmd>tabnew | Ntree<CR>", {})
-- create terminal split
vim.keymap.set('n', "<leader>n", "<cmd>bot split | resize 15 | startinsert | terminal<CR>", {})


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Other
--
-- allow easy terminal window movement
vim.keymap.set('t', "<C-w>", "<C-\\><C-N><C-w>", {})
