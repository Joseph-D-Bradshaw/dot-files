return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "luacheck",
        "shellcheck",
        "typescript-language-server",
        "css-lsp",
      },
    },
  },
}
