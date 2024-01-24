return {
  {
    "rcarriga/nvim-notify",
    enabled = true,
  },
  -- Disable opening signature help automatically
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          auto_open = {
            trigger = false,
          },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      -- Skip annoying message when hovering
      routes = {
        {
          opts = { skip = true },
          filter = {
            event = "notify",
            find = "No information available",
          },
        },
      },
    },
  },
  -- Symbols outline panel
  {
    "simrat39/symbols-outline.nvim",
    opts = {
      position = "right",
    },
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<CR>", desc = "Symbols outline" },
    },
  },
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- Disable the default Neotree binding
      { "<leader>e", false },
      -- Add my binding
      { "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Neotree (explorer)" },
    },
  },
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
                                                                         
          |                    |     |         --.--                     
          |,---.,---.,---.,---.|---.' ,---.      |  ,---.,---.,-.-.      
          ||   |`---.|---'|   ||   |  `---.      |  |---'|    | | |      
      `---'`---'`---'`---'|---'`   '  `---'      `  `---'`    ` ' '      
                          |                                              
                                                                         ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
