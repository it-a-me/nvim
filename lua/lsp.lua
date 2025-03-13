vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<M-f>", vim.lsp.buf.format,
  { desc = "Format buffer with lsp server" })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      vim.print('Failed to get id for attached lsp server')
      return
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })

    if client:supports_method('textDocument/completion') then
      -- Enable auto-completion
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    vim.keymap.set('i', '<C-n>',
      function()
        if vim.fn.pumvisible() == 0 then
          vim.lsp.completion.trigger()
        end
      end
      , { buffer = true })
  end,
})
