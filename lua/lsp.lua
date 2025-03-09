vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      vim.print('Failed to get id for attached lsp server')
      return
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
  end,
})
