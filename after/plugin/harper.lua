local statedir = vim.fn.stdpath('state')
local maskdir = vim.fs.joinpath(statedir, "lspmask")
local harper_state = vim.fs.joinpath(maskdir, "harper_mask")

vim.fn.mkdir(maskdir, "p")

vim.api.nvim_create_user_command('ToggleHarper', function(_)
  local _, _, err_name = vim.uv.fs_stat(harper_state)
  if err_name == "ENOENT" then
    local fd, err = vim.uv.fs_open(harper_state, "w", tonumber('755', 8))
    if fd then
      vim.uv.fs_close(fd)
    else
      print("Failed to create file: " .. err)
    end
    vim.lsp.enable('harper_ls', false)
  else
    vim.fs.rm(harper_state)
    vim.lsp.enable('harper_ls', true)
  end
end, {})

local _, _, err_name = vim.uv.fs_stat(harper_state)
if err_name ~= "ENOENT" then
  vim.lsp.enable('harper_ls', false)
end
