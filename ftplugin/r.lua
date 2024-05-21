vim.bo.shiftwidth = 2

local function r_output(err, data)
  local channel_id = vim.api.nvim_buf_get_var(0, 'R_IPC')
  if channel_id == nil then
    return
  end

  if err ~= nil then
    vim.api.nvim_err_writeln('err: ' .. err)
  end

  if data ~= nil then
    vim.api.nvim_chan_send(channel_id, data)
  end
end

local function setup_repr_buf()
  local buf_id = vim.api.nvim_create_buf(true, false)
  local source_buf = vim.api.nvim_get_current_buf()
  local win_id = vim.api.nvim_open_win(buf_id, false, { vertical = false })
  vim.api.nvim_buf_create_user_command(buf_id, 'ReprStop', function()
    StopRepr(source_buf)
  end, {})
  return buf_id, win_id
end

local function start_r_handle(buf_path)
  local r_ipc = vim.system({ 'R', '--vanilla', '--quiet', '--interactive' }, {
    stdout = function(err, data)
      vim.defer_fn(function()
        r_output(err, data)
      end, 0)
    end,
    stderr = function(err, data)
      vim.defer_fn(function()
        r_output(err, data)
      end, 0)
    end,
    stdin = true,
  }, StopRepr)
  r_ipc:write(vim.keycode '<C-L>' .. 'source("' .. buf_path .. '")\n')
  return r_ipc
end

function StartRepr(source_buf)
  if pcall(function()
    vim.api.nvim_buf_get_var(source_buf, 'R_Repr')
  end) then
    print 'repr already started'
    return
  end
  local r_ipc = start_r_handle(vim.api.nvim_buf_get_name(source_buf))
  local buf_id = setup_repr_buf()
  local term_writer = vim.api.nvim_open_term(buf_id, {
    on_input = function(_, _, _, data)
      r_ipc:write(data)
    end,
  })
  vim.api.nvim_buf_set_var(buf_id, 'R_IPC', term_writer)
  vim.api.nvim_buf_set_var(source_buf, 'R_IPC', term_writer)

  local aucmd_id = vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function()
      r_ipc = start_r_handle(vim.api.nvim_buf_get_name(source_buf))
    end,
    buffer = source_buf,
  })

  vim.api.nvim_buf_set_var(source_buf, 'R_Repr', { buf_id = buf_id, aucmd_id = aucmd_id })
end

function StopRepr(source_buf)
  local repr_config
  if not pcall(function()
    repr_config = vim.api.nvim_buf_get_var(source_buf, 'R_Repr')
  end) then
    print 'repr is not running'
    return
  end

  vim.api.nvim_del_autocmd(repr_config.aucmd_id)
  vim.api.nvim_buf_delete(repr_config.buf_id, {
    force = true,
  })

  vim.api.nvim_buf_del_var(source_buf, 'R_Repr')
end

vim.api.nvim_buf_create_user_command(0, 'ReprStart', function()
  StartRepr(0)
end, {})

vim.api.nvim_buf_create_user_command(0, 'ReprStop', function()
  StopRepr(0)
end, {})
