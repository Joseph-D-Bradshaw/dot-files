local lspzero = require('lsp-zero')

lspzero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lspzero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers 
