local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager
  use {
    'williamboman/nvim-lsp-installer', -- Helps lsp find our server installs (does not install for us)
    'neovim/nvim-lspconfig' -- LSP
  }
  use {
    'svrana/neosolarized.nvim', -- Correct solarized dark control over nvim UI elements
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'L3MON4D3/LuaSnip' -- Snippets
  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vs-code like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- nvim-cmp floating signature when typing
  use 'hrsh7th/nvim-cmp' -- Completion
  -- use { 'neoclide/coc.nvim', branch = 'release' }
  use {
    'nvim-treesitter/nvim-treesitter', -- Syntax highlighting (per language)
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs' -- Pair up brackets and quotes
  use 'windwp/nvim-ts-autotag' -- Add matching tags in XML like docs
  use 'nvim-lua/plenary.nvim' -- A dependency of another plugin
  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder, initiate via <sf>
  use 'nvim-telescope/telescope-file-browser.nvim'
end)
