local M = {}

function M.setup()
	local status, aerial = pcall(require, 'aerial')
	if not status then return end

	aerial.setup()
end

return M
