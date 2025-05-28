-- This contains all my personal overrides over the LazyVim core plugin installations
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    opts = { style = "storm" },
  },
  -- Snacks suite, glue for plenty of functionality
  {
    "folke/snacks.nvim",
    -- INFO: FZF search syntax for Snacks.picker/explorer https://junegunn.github.io/fzf/search-syntax/
    keys = {
      -- Toggle Local Explorer
      {
        "<leader>n",
        function()
          Snacks.explorer()
        end,
        desc = "Toggle Explorer (cwd)",
      },
      -- Toggle Root Explorer
      {
        "<leader>N",
        function()
          ---@diagnostic disable-next-line: missing-fields
          Snacks.explorer({ cwd = LazyVim.root() })
        end,
        desc = "Toggle Explorer (root dir)",
      },
      -- Find Text, seeing if it is okay enough replacement for Telescope
      {
        "<leader>ft",
        function()
          Snacks.dashboard.pick("live_grep")
        end,
        desc = "Find Text",
      },
    },
    -- Dashboard
    ---@type snacks.Config
    opts = {
      picker = {
        layout = "vertical",
      },
      dashboard = {
        preset = {
          header = [[
                                          
          |                    |          
          |,---.,---.,---.,---.|---.      
          ||   |`---.|---'|   ||   |      
      `---'`---'`---'`---'|---'`   '      
                          |               
  ]],
        },
      },
    },
  },
  -- Notifications
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          -- Do not show message if hover is not available
          -- e.g.: <S-K> for LSP hover
          silent = true,
        },
      },
    },
  },
  -- Syntax tree extensions on default behaviour
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "svelte",
        "html",
        "css",
        "vim",
        "lua",
        "json",
        "yaml",
        "ruby",
      })
      opts.indent = {
        enabled = true,
      }
    end,
  },
}
