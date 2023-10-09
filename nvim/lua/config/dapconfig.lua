local M = {}

function M.setup()
	local mason_dapconfig = require('mason-nvim-dap')
	mason_dapconfig.setup {
		ensure_installed = {
			'python',  					-- debugpy
			'js',						-- js-debug-adapter
			'chrome',					-- chrome-debug-adapter
			'firefox'					-- firefox-debug-adapter
		},
		automatic_installation = true,
		handlers = {}
		-- handlers = {
		-- 	function(config)
		-- 		require('mason-nvim-dap').default_setup(config)
		-- 	end,
		-- 	js = function(config)
		-- 		config.adapters = {
		-- 			type = 'executable',
		-- 			command = vim.fn.stdpath('data') .. '/mason/bin/js-debug-adapter',
		-- 			args = {}
		-- 		}
		-- 	end
		-- }
	}
end

return M

