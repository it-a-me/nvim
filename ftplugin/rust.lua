---@diagnostic disable-next-line: duplicate-set-field
vim.b.Test = function()
  vim.system({ "cargo", "test" }, {}, function(res)
    vim.defer_fn(function()
      vim.api.nvim_echo({ { res.stdout } }, true, {})
    end, 0)
  end)
end

---@diagnostic disable-next-line: duplicate-set-field
vim.b.Lint = function()
  vim.system({ "cargo", "clippy" }, {}, function(res)
    if res.stdout == "" then
      vim.print("No Errors Detected")
      return
    end
    vim.defer_fn(function()
      vim.api.nvim_echo({ { res.stdout } }, true, {})
    end, 0)
  end)
end
