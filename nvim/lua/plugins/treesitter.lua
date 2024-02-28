return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- What isn't already installed by default or by lazyvim extras
      ensure_installed = {
        "cmake",
        "css",
        "gitignore",
        "http",
        "scss",
        "vimdoc",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extensions = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
