local M = {}

function M.setup()
	local whichkey = require('which-key')

	local conf = {
		window = {
			border = 'single', 			-- none, single, double, shadow
			position = 'bottom'			-- 'bottom', 'top'
		}
	}

	local opts = {
		mode = 'n',			-- Normal mode
		prefix = '<leader>',
		buffer = nil,		-- Global mappings, specify a buffer number for buffer local mappings
		silent = true,		-- use `silent` when creating keymaps
		noremap = true,		-- use `noremap` when creating keymaps
		nowait = false,		-- use `noremap` when creating keymaps
	}

	local mappings = {
		['q'] = { '<cmd>q!<CR>', 'Quit' },
		['Q'] = { '<cmd>wq!<CR>', 'Save & Quit' },
		a = { '<cmd>AerialToggle<CR>', 'Show (Aerial) Symbols' },
		d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostic (in line)' },

		j = { '<Plug>RestNvim<CR>', 'Execute HTTP Request' },

		b = {
			name = 'Buffer',
			c = { '<cmd>bd!<CR>', 'Close current buffer' },
			D = { '<cmd>%bd|e#|bd#<CR>', 'Delete all buffers' }
		},

		z = {
			name = 'Packer',
			c = { '<cmd>PackerCompile<CR>', 'Compile' },
			i = { '<cmd>PackerInstall<CR>', 'Install' },
			s = { '<cmd>PackerSync<CR>', 'Sync' },
			S = { '<cmd>PackerStatus<CR>', 'Status' },
			u = { '<cmd>PackerUpdate<CR>', 'Update' }
		},

		g = {
			name = 'Git',
			g = { '<cmd>LazyGit<CR>', 'LazyGit' },
			s = { '<cmd>Neogit<CR>', 'Status' }
		},

		f = {
			name = 'Telescope',
			f = { '<cmd>Telescope find_files<CR>', 'Find Files' },
			d = { '<cmd>Telescope diagnostics<CR>', 'Diagnostics' },
			e = { '<cmd>Telescope file_browser<CR><ESC>', 'Explorer' },
			b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
			t = { '<cmd>Telescope live_grep<CR>', 'Text Search' },
			h = { '<cmd>Telescope help_tags<CR>', 'Help Tags' },
			s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
			w = { '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', 'Workspace Symbols' }
		},

		n = { '<cmd>NvimTreeToggle<CR>', 'Explorer' }
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M

