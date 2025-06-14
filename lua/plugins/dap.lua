return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
    { "leoluz/nvim-dap-go",   config = {} }
  },
  init = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open

    vim.keymap.set("n", "<leader>gt", function()
      dap.terminate()
      dapui.toggle()
    end, { desc = "Toggle UI" })

    vim.keymap.set("n", "<leader>gc", function() dap.continue({}) end, { desc = "Continue" })

    vim.keymap.set("n", "<leader>gb", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>gB", function() dap.clear_breakpoints() end, { desc = "Clear Breakpoints" })
    vim.keymap.set("n", "<leader>gC", function() dap.run_to_cursor() end, { desc = "Run to Curser" })
    vim.keymap.set("n", "<leader>gn", function() dap.step_over() end, { desc = "Step Next" })
    vim.keymap.set("n", "<leader>gp", function() dap.step_back() end, { desc = "Step Previous" })
    vim.keymap.set("n", "<leader>go", function() dap.step_out() end, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>gi", function() dap.step_into() end, { desc = "Step In" })
  end
}
