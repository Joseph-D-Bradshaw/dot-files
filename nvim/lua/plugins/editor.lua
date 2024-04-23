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
      "<leader>fP",
      function()
        builtin.find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find plugin file",
    },
    {
      "<leader>ft",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Find text (with args)",
    },
    {
      "<leader>fe",
      function()
        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = true,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end,
      desc = "Explore files",
    },
  },
  config = function(_, opts)
    require("telescope").load_extension("live_grep_args")
    local fb_actions = telescope.extensions.file_browser.actions

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
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
}
