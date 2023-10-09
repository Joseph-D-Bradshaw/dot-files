local M = {}

function M.setup()
	-- Js related setups go in here
	-- local js = require('config.debugger.javascript')
	-- js.setup()

	local dap =	require('dap')
	local dapui = require('dapui')
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end

	require('dap.ext.vscode').load_launchjs()
end

return M

