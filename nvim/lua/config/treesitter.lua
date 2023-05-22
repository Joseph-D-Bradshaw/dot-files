local M = {}

function M.setup()
	local status, treesitter = pcall(require, 'nvim-treesitter')
	if not status then return end

	treesitter.setup()
end

return M

