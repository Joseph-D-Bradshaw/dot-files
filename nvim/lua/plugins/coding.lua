-- Incremental rename
return {
  -- default binds to <leader>cr for Rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  -- Minimal configuration
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "qwen2.5:7b",
    },
  },
  -- Guess the indent of the file by looking over a few hundred lines and setting buffer options
  {
    "nmac427/guess-indent.nvim",
    event = "LazyFile",
    config = function()
      require("guess-indent").setup({})
    end,
  },
  -- For hopping around specific files constantly
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Append to harpoon",
      },
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "Harpoon to file 5",
      },
      {
        "<leader>hn",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon to next file",
      },
      {
        "<leader>hN",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon to prev file",
      },
    },
  },
  -- Refactoring plugin
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufEnter",
    config = function()
      require("refactoring").setup({})
    end,
    keys = {
      { "<leader>re", ":Refactor extract ", mode = "x", desc = "Extract" },
      { "<leader>rf", ":Refactor extract_to_file ", mode = "x", desc = "Extract to file" },
      { "<leader>rv", ":Refactor extract_var ", mode = { "x", "n" }, desc = "Extract var" },
      { "<leader>ri", ":Refactor inline_var ", mode = "n", desc = "Inline var" },
      { "<leader>rI", ":Refactor inline_func ", mode = "n", desc = "Inline func" },
      { "<leader>rb", ":Refactor extract_block ", mode = "n", desc = "Extract block" },
      { "<leader>rbi", ":Refactor extract_block_to_file ", mode = "n", desc = "Extract block to file" },
      {
        "<leader>rr",
        function()
          require("refactoring").select_refactor()
        end,
        mode = { "n", "x" },
        desc = "Refactor",
      },
    },
  },
  -- Gitsigns/hunk keybindings overwrite
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    keys = {
      { "<leader>ghn", ":Gitsigns next_hunk<CR>", mode = "n", desc = "Next Hunk" },
      { "<leader>ghN", ":Gitsigns prev_hunk<CR>", mode = "n", desc = "Prev Hunk" },
    },
  },
}
