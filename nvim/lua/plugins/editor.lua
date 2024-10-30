local telescope = require("telescope")
local builtin = require("telescope.builtin")

return {
  "telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  keys = {
    {
      "<leader>ft",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Find text (with args)",
    },
  },
  config = function(_, opts)
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "vertical",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
      path_display = { "truncate" },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }
    opts.extensions = {
      live_grep_args = {
        auto_quoting = true,
      },
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        ["n"] = {
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("live_grep_args")
  end,
}
