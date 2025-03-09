vim.lsp.inlay_hint.enable(true)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation
    end

    if client:supports_method('textDocument/completion') then
      -- Enable auto-completion
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    vim.keymap.set('i', '<C-n>', vim.lsp.completion.trigger)
    vim.keymap.set('i', '<C-p>', vim.lsp.completion.trigger)
    vim.keymap.set("n", "<M-f>", function()
      vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
    end)

    -- if client:supports_method('textDocument/formatting') then
    --   -- Format the current buffer on save
    --   vim.api.nvim_create_autocmd('BufWritePre', {
    --     buffer = args.buf,
    --     callback = function()
    --       vim.lsp.buf.format({bufnr = args.buf, id = client.id})
    --     end,
    --   })
    -- end
  end,
})
