return {
  "ThePrimeagen/99",
  dependencies = {
    "saghen/blink.compat",
  },
  config = function()
    local _99 = require("99")

    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)
    _99.setup({
      provider = _99.Providers.ClaudeCodeProvider,
      logger = {
        level = _99.DEBUG,
        path = "/tmp/" .. basename .. ".99.debug",
        print_on_error = true,
      },
      -- When setting this to something that is not inside the CWD tools
      -- such as claude code or opencode will have permission issues
      -- and generation will fail refer to tool documentation to resolve
      -- https://code.claude.com/docs/en/permissions#read-and-edit
      tmp_dir = "./tmp",

      --- Completions: #rules and @files in the prompt buffer
      completion = {
        custom_rules = {
          "scratch/custom_rules/",
        },

        --- Configure @file completion (all fields optional, sensible defaults)
        files = {
          -- enabled = true,
          -- max_file_size = 102400,     -- bytes, skip files larger than this
          -- max_files = 5000,            -- cap on total discovered files
          -- exclude = { ".env", ".env.*", "node_modules", ".git", ... },
        },
        --- File Discovery:
        --- - In git repos: Uses `git ls-files` which automatically respects .gitignore
        --- - Non-git repos: Falls back to filesystem scanning with manual excludes
        --- - Both methods apply the configured `exclude` list on top of gitignore

        --- What autocomplete engine to use. Defaults to native (built-in) if not specified.
        source = "blink", -- "native" (default), "cmp", or "blink"
      },

      --- WARNING: if you change cwd then this is likely broken
      --- ill likely fix this in a later change
      ---
      --- md_files is a list of files to look for and auto add based on the location
      --- of the originating request.  That means if you are at /foo/bar/baz.lua
      --- the system will automagically look for:
      --- /foo/bar/AGENT.md
      --- /foo/AGENT.md
      --- assuming that /foo is project root (based on cwd)
      md_files = {
        "AGENT.md",
      },
    })

    -- take extra note that i have visual selection only in v mode
    -- technically whatever your last visual selection is, will be used
    -- so i have this set to visual mode so i dont screw up and use an
    -- old visual selection
    --
    -- likely ill add a mode check and assert on required visual mode
    -- so just prepare for it now
    vim.keymap.set("v", "<leader>9v", function()
      _99.visual()
    end)

    --- if you have a request you dont want to make any changes, just cancel it
    vim.keymap.set("n", "<leader>9x", function()
      _99.stop_all_requests()
    end)

    vim.keymap.set("n", "<leader>9s", function()
      _99.search()
    end)

    vim.keymap.set("n", "<leader>9t", function()
      _99.tutorial()
    end)

    vim.keymap.set("n", "<leader>9w", function()
      _99.Extensions.Worker.set_work()
    end)
  end,
}
