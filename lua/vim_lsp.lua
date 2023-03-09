require("mason").setup()
require("mason-lspconfig").setup {
   -- automatically install language servers setup below for lspconfig
   automatic_installation = true
}
local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("mason-lspconfig").setup_handlers {
   -- The first entry (without a key) will be the default handler
   -- and will be called for each installed server that doesn't have
   -- a dedicated handler.
   function(server_name) -- default handler (optional)
      require("cmp_config")
      require("lspconfig")[server_name].setup {
         on_attach = require 'lsp_config'.on_attach,
      }
   end,
       ["lua_ls"] = function()
      require("cmp_config")
      require("neodev").setup({
         library = { plugins = { "nvim-dap-ui" }, types = true },
      })
      require 'lspconfig'.lua_ls.setup({
         on_attach = require 'lsp_config'.on_attach,
         settings = {
            Lua = {
               completion = {
                  callSnippet = "Replace"
               }
            }
         }
      })
   end,
   -- Next, you can provide a dedicated handler for specific servers.
   -- For example, a handler override for the `rust_analyzer`:
       ["rust_analyzer"] = function()
      require("cmp_config")
      local rt = require("rust-tools")
      rt.setup {
         server = {
            on_attach = function(client, bufnr)
               require 'lsp_config'.on_attach(client, bufnr)

               -- Hover actions
               vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
               -- Code action groups
               vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
         }, }
   end
}
