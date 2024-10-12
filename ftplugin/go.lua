---@diagnostic disable-next-line: duplicate-set-field
vim.b.Test = function()
  -- hack vim.cmd to merge stderr
  vim.cmd('!go test ./...')
end

---@diagnostic disable-next-line: duplicate-set-field
vim.b.Lint = function()
  vim.system({ "golangci-lint", "run" }, {}, function(res)
    vim.defer_fn(function()
      vim.api.nvim_echo({ { res.stdout } }, true, {})
    end, 0)
  end)
end
