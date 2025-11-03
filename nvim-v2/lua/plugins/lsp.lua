return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          enabled = true,
          cmd = { "mise", "exec", "--", "ruby-lsp" },
        },
      },
    },
  },
}
