function AddFormatter(buffer, formatter)
  vim.b[buffer].Autofmt = formatter
end

function Autofmt(buffer)
  local formatter = vim.b[buffer].Autofmt
  if formatter == nil then
    print("no formatter for buffer")
    return
  end
  local err = formatter()
  if err ~= nil then
    print("formatter exited unexpectedly\n" .. err)
  end
end

function CliWrapper(cmd)
  return function()
    local contents = table.concat(vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false), "\n")
    local output = vim.fn.system(cmd, contents)
    local exit_code = vim.v.shell_error;
    if exit_code ~= 0 then
      return "Error:" .. exit_code .. "\n" .. output
    else
      vim.api.nvim_buf_set_lines(0, 0, vim.api.nvim_buf_line_count(0), false, vim.split(output, "\n", {}))
    end
  end
end

vim.api.nvim_create_user_command("Autofmt", function()
  Autofmt(0)
end, {})
