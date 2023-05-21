local M = {}

function M.setup()
	local status, neogit = pcall(require, 'neogit')
	if not status then return end

	neogit.setup {}
end

return M

