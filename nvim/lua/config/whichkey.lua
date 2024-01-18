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
		['~'] = { '<cmd>Alpha<CR>', 'Homescreen' },
		a = { '<cmd>AerialToggle<CR>', 'Show (Aerial) Symbols' },

		b = {
			name = 'Buffer',
			c = { '<cmd>bd!<CR>', 'Close current buffer' },
			D = { '<cmd>%bd|e#|bd#<CR>', 'Delete all buffers' }
		},

		d = {
			name = "Debug",
			d = { '<cmd>DapToggleBreakpoint<CR>', 'Breakpoint' },
			c = { '<cmd>DapContinue<CR>', 'Continue' },
			C = { '<cmd>lua require("dap").run_to_cursor()<CR>', "Run to cursor"},
			T = { '<cmd>lua require("dap").terminate()<CR>', "Terminate session"},
			w = { '<cmd>lua require("dap.ui.widgets").hover()<CR>', "Widgets"},
			s = { '<cmd>DapStepOver<CR>', 'Step Over' },
			i = { '<cmd>DapStepInto<CR>', 'Step Into' },
			r = { '<cmd>DapToggleRepl<CR>', 'REPL' },
			u = { '<cmd>lua require("dapui").toggle()<CR>', 'UI' },
			e = { '<cmd>lua require("dapui").eval()<CR>', 'Evaluate' },
		},

		e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Errors (in line)' },

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

		g = {
			name = 'Git',
			g = { '<cmd>LazyGit<CR>', 'LazyGit' },
			s = { '<cmd>Neogit<CR>', 'Status' },
			c = { '<cmd>Gen<CR>', 'Chat' }
		},

		j = { '<Plug>RestNvim<CR>', 'Execute HTTP Request' },

		n = { '<cmd>NvimTreeToggle<CR>', 'Explorer' },

		q = { '<cmd>q!<CR>', 'Quit' },

		Q = { '<cmd>wq!<CR>', 'Save & Quit' },

		t = { '<cmd>ToggleTerm direction=float<CR>', 'Terminal (float)' },

		z = {
			name = 'Packer',
			c = { '<cmd>PackerCompile<CR>', 'Compile' },
			i = { '<cmd>PackerInstall<CR>', 'Install' },
			s = { '<cmd>PackerSync<CR>', 'Sync' },
			S = { '<cmd>PackerStatus<CR>', 'Status' },
			u = { '<cmd>PackerUpdate<CR>', 'Update' }
		},
		m = {
			name = 'Marks',
			l = {
				name = 'List',
				a = { '<cmd>MarksListAll<CR>', 'All' },
				b = { '<cmd>MarksListBuf<CR>', 'Buffer' },
				g = { '<cmd>MarksListGlobal<CR>', 'Global' },
			}
		}
	}

	local visual_mappings = {
		g = { '<cmd>:Gen<CR>', 'Talk to an LLM' }
	}

	local visual_opts = {
		mode = 'v',			-- Normal mode
		prefix = '<leader>',
		buffer = nil,		-- Global mappings, specify a buffer number for buffer local mappings
		silent = true,		-- use `silent` when creating keymaps
		noremap = true,		-- use `noremap` when creating keymaps
		nowait = false,		-- use `noremap` when creating keymaps
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
	whichkey.register(visual_mappings, visual_opts)
end

return M

