vim.keymap.set('n', '<M-f>',
  function()
    vim.cmd('%!pandoc --from gfm --to gfm -')
  end, { buffer = true })
