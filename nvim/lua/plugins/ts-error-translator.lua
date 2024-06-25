return {
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "LazyFile",
    config = function()
      require("ts-error-translator").setup()
    end,
  },
}
