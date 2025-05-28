return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          enabled = true,
          cmd = { os.getenv("HOME") .. "/.asdf/shims/ruby-lsp" },
        },
      },
    },
  },
}
