-- This contains all my personal overrides over the LazyVim core plugin installations
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = { style = "storm" },
  },
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
}
