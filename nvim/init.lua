-- bootstrap lazy.nvim package manager if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('defaults')             -- configure vim itself, tabs, shiftwidth, etc
require('keymaps')              -- set default key maps tied to vim itself (non-leader key bindings)


-- Setup all plugins
require("lazy").setup({
    {
        -- Colourscheme
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function ()
            vim.cmd[[colorscheme tokyonight-storm]]
        end
    },
    -- Syntax highlighting and giving other plugins the ability to read the syntax tree
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require('plugins.treesitter')
        end
    },
    -- Leader key visualises commands
    {
        "folke/which-key.nvim",
        config = function()
            require('plugins.whichkey')
        end
    },
    -- Lua intellisense/help
    {
        "folke/neodev.nvim",
        lazy = true
    },
    -- Powerful file/text finder tool/file browser
    -- NOTE: relies on ripgrep and fzf to be installed on system
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        },
        config = function ()
            require('plugins.telescope')
        end,
        lazy = true,
        cmd = 'Telescope'
    },
    -- Traditional file browser
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function ()
            require('plugins.nvimtree')
        end,
        lazy = true,
        cmd = 'NvimTreeToggle'
    },
    -- Best Git Client
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = true,
        cmd = 'LazyGit'
    },
    -- Document Symbols Sidebar
    {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup()
        end,
        lazy = true,
        cmd = 'AerialToggle'
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require('plugins.dashboard')
        end,
        lazy = false
    }

    -- TODO:
    -- Autopair
    -- Autotag
    -- LSP
    -- Refactoring
    -- React/React Native
    -- Debugger
    -- Formatting (conform.nvim, should work with prettier)
    -- Home screen
    -- File Breadcrumbs
    -- Buffers as tabs
    -- gen.nvim (if ollama is found on system)
    -- commenting (via gcc) and support for visual

})

