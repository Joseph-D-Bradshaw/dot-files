return {
  -- Disable bufferline, which adds VSCode like tabs in the `:h tabline` area
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    enabled = true,
    opts = {
      level = 3,
    },
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
      -- Skip annoying messages
      routes = {
        {
          opts = { skip = true },
          filter = {
            event = "notify",
            find = "No information available",
          },
        },
        {
          opts = { skip = true },
          filter = {
            event = "notify",
            find = "class, constructor, enum, field, function, interface, method, module, namespace, package, property, struct, trait symbol(s) were not part of the query results",
          },
        },
        {
          opts = { skip = true },
          filter = {
            event = "notify",
            find = "Request textDocument/inlayHint failed",
          },
        },
      },
    },
  },
  -- Symbols outline panel
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      position = "right",
    },
    keys = {
      { "<leader>cs", "<cmd>Outline<CR>", desc = "Symbols outline" },
    },
  },
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    keys = {
      -- Disable the default Neotree binding
      { "<leader>e", false },
      -- Add my binding
      { "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Neotree (explorer)" },
    },
  },
  -- Dashboard
  {
    "folke/snacks.nvim",
    event = "VimEnter",
    opts = {
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
}
