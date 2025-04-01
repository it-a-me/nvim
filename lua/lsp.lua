vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,
  { desc = "Code Action" })


vim.keymap.set("n", "<leader>qo",
  function()
    vim.diagnostic.setqflist()
    vim.cmd.copen()
  end,
  { desc = "Open Quickfix List" })


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      vim.print('Failed to get id for attached lsp server')
      return
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'goto definition', buffer = args.buf })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'godo declaration', buffer = args.buf })
    vim.keymap.set('n', 'grc', vim.lsp.codelens.run, { desc = 'vim.lsp.codelens.run()', buffer = args.buf })

    if client:supports_method('textDocument/completion') then
      -- Enable auto-completion
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end


    vim.keymap.set('i', '<C-n>',
      function()
        if vim.fn.pumvisible() == 0 then
          vim.lsp.completion.get()
        end
      end
      , { buffer = true })
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave", "BufWritePost" }, {
  callback = function(args)
    vim.lsp.codelens.refresh({ bufnr = args.buf })
  end
})
