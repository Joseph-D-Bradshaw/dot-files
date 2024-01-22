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
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- LSP Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function () require('plugins.lspzero') end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp'
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip'
        },
        lazy = true,
        config = false
    },

    -- Lua intellisense/help
    {
        "folke/neodev.nvim",
        priority = 999,
        config = function () require('neodev').setup() end,
    },
    -- Colourscheme
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function () vim.cmd.colorscheme('tokyonight-storm') end
    },
    -- Syntax highlighting and giving other plugins the ability to read the syntax tree
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () require('plugins.treesitter') end,
        event = 'VeryLazy'
    },
    -- Leader key visualises commands
    {
        "folke/which-key.nvim",
        config = function() require('plugins.whichkey') end,
        event = 'VeryLazy'
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
        config = function () require('plugins.telescope') end,
        lazy = true,
        cmd = 'Telescope'
    },
    -- Traditional file browser
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function () require('plugins.nvimtree') end,
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
        config = function() require('aerial').setup() end,
        lazy = true,
        cmd = 'AerialToggle'
    },
    -- Customizable Homescreen
    -- Appears when nvim is launched directly without a directory or file
    {
        'goolord/alpha-nvim',
        config = function () require('plugins.dashboard') end,
    },
    -- Drop the code, map to <leader>fml or similar in whichkey
    {
        'eandrju/cellular-automaton.nvim',
        config = function () require('cellular-automaton') end,
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        lazy = true,
        cmd = 'CellularAutomaton',
    },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    -- Harpoon, tl;dr just marks on steroids
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function () require('plugins.harpoon') end
    },
    -- Improve built-in LSP experience
    --{
     --   'nvimdev/lspsaga.nvim',
      --  config = function()
       --     require('lspsaga').setup({})
        --end,
        --dependencies = {
         --   'nvim-treesitter/nvim-treesitter', -- optional
          --  'nvim-tree/nvim-web-devicons'     -- optional
       -- },
        --event = 'LspAttach'
   -- }

    -- TODO:
    -- LSP
    -- Refactoring
    -- React/React Native
    -- Debugger
    -- Formatting (conform.nvim, should work with prettier)
    -- Prettier -> EsLint -> Look at craftzdog
    -- File Breadcrumbs
    -- gen.nvim (if ollama is found on system)
    -- commenting (via gcc) and support for visual
    -- Consider something for jumping around, like flash.nvim

})

