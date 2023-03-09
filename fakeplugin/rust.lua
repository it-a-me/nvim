local rt = require("rust-tools")
--require 'lsp_config'
--require 'cmp_config'
rt.setup({
   server = {
      on_attach = function(client, bufnr)
         require 'lsp_config'.on_attach(client, bufnr)

         -- Hover actions
         vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
         -- Code action groups
         vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
   },
})
