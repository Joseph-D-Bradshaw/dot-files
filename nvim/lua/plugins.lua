local M = {}

function M.setup()
	-- Indicate first time installation
	local packer_bootstrap = false

	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0, -- time in ms plugins must take to load before being shown in profile
		},
		display = {
			open_fn = function()
				return require('packer.util').float { border = 'rounded' }
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run :PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
			}
			vim.cmd [[packadd packer.nvim]]
		end
		vim.cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'
	end

	-- Plugins
	local function plugins(use)
		-- Core
		use { 'wbthomason/packer.nvim' } -- Plugin manager
		use {
			'nvim-treesitter/nvim-treesitter', -- Tree parsing of text to enable other features
			run = ':TSUpdate',
			config = function()
				require('config.treesitter').setup()
			end
		}
		use { 'nvim-lua/plenary.nvim', module = 'plenary' } -- Load only when required (utils)
		use {
			'williamboman/mason.nvim', -- Installs language servers, debuggers and linter
			'williamboman/mason-lspconfig', -- Adds help for mapping LS aliases from Mason to lspconfig
			'neovim/nvim-lspconfig',-- Default configs for each LSP
			'folke/neodev.nvim' -- Config for Lua language (full signature, recognize vim global etc)
		}
		-- Colourscheme
		use {
			'Tsuzat/NeoSolarized.nvim',
			config = function()
				vim.cmd 'colorscheme NeoSolarized'
			end
		}

		-- Startup screen
		use {
			'goolord/alpha-nvim',
			config = function()
				require('config.alpha').setup()
			end
		}

		-- LSP related (in after/plugins)
		use {
			'onsails/lspkind-nvim',	-- vscode like pictograms to lsp autocomplete
			'hrsh7th/cmp-buffer',	-- completion source for buffers
			'hrsh7th/cmp-nvim-lsp',	-- completion source for neovim built in lsp
			'hrsh7th/nvim-cmp',	-- Completion
			'L3MON4D3/LuaSnip', -- Snippet engine for completion to work
		}

		-- Git
		use {
			'TimUntersberger/neogit',
			cmd = 'Neogit',	-- Lazyload via ':Neogit'
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('config.neogit').setup()
			end
		}

		-- WhichKey (show key mappings as we are in normal mode)
		use {
			'folke/which-key.nvim',
			event = 'VimEnter', -- :h VimEnter for details (lazyloading on event)
			config = function()
				require('config.whichkey').setup()
			end
		}

		-- Show buffers as tabs at top of editor
		use {
			'akinsho/nvim-bufferline.lua',
			event = 'BufReadPre',
			wants = 'nvim-web-devicons',
			config = function()
				require('config.bufferline').setup()
			end
		}

		-- Side panel file browser
		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvimtree/nvim-web-devicons'
			},
			cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
			config = function()
				require('config.nvimtree').setup()
			end
		}

		-- Floating window fuzzy finder
		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',						-- utils
				'BurntSushi/ripgrep',							-- live_grep - Install on local system via OS package manager
				'sharkdp/fd',									-- finder
				'nvim-treesitter/nvim-treesitter', 				-- finder/preview
				'nvim-tree/nvim-web-devicons',					-- icons
			},
			config = function()
				require('config.telescope').setup()
			end
		}

		-- File browser extension for telescope
		use {
			'nvim-telescope/telescope-file-browser.nvim',	-- file browser
		}

		-- Indent guides (always show)
		use {
			'lukas-reineke/indent-blankline.nvim',
			event = 'BufReadPre', -- Load before reading buffer
			config = function()
				require('config.indentblankline').setup()
			end
		}

		-- Nice icons
		use {
			'nvim-tree/nvim-web-devicons',
			module = 'nvim-web-devicons',
			config = function()
				require('nvim-web-devicons').setup { default = true }
			end
		}

		-- Auto bracket closing
		use {
			'windwp/nvim-autopairs',
			event = 'InsertEnter',
			config = function()
				require('nvim-autopairs').setup {}
			end
		}

		-- Comment code
		use {
			'numToStr/Comment.nvim',
			opt = true,
			keys = { 'gc', 'gcc', 'gbc' },
			config = function()
				require('Comment').setup {}
			end
		}

		-- Easy hopping
		use {
			'phaazon/hop.nvim',
			cmd = { 'HopWord', 'HopChar1' },
			config = function()
				require('hop').setup {}
			end
		}

		-- Markdown
		use {
			'iamcco/markdown-preview.nvim',
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
			ft = 'markdown',
			cmd = { 'MarkdownPreview' }
		}

		-- Nicer Statusline
		use {
			'nvim-lualine/lualine.nvim',
			event = 'VimEnter',
			config = function()
				require('config.lualine').setup()
			end,
			requires = { 'nvim-web-devicons' }
		}

		if packer_bootstrap then
			print('Restart Neovim required after installation')
			require('packer').sync()
		end
	end

	-- Run Setup
	packer_init()

	local packer = require('packer')
	packer.init(conf)
	packer.startup(plugins)
	require('mason').setup()
	-- require('neodev').setup()

	-- Automatic language server setup via Mason
	local mason_lspconfig = require('mason-lspconfig')
	mason_lspconfig.setup()
    mason_lspconfig.setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- you can provide a dedicated handler for specific servers. set automatic mason help
    })
end

return M

