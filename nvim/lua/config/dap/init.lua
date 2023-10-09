local M = {}

function M.setup()
	local status, jsdap = pcall(require, 'config.dap.javascript')
	if not status then return end

	local function configure_debuggers()
		require('config.dap.javascript').setup()
	end

	configure_debuggers()
	jsdap.setup()
end

return M


