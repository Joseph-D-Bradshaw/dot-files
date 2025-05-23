return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    -- "BufReadPre" .. vim.fn.expand "~" .. "Documents/Attensi/*.md",
    -- "BufNewFile" .. vim.fn.expand "~" .. "Documents/Attensi/*.md"
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Personal Knowledge Management",
      },
      {
        name = "work",
        path = "~/Documents/Attensi",
      },
    },
    daily_notes = {
      folder = "Daily Notes",
      default_tags = { "daily" },
      template = "Daily Note.md",
    },
    templates = {
      folder = "Templates",
    },

    -- see below for full list of options 👇
  },
}
