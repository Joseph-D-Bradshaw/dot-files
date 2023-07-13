local M = {}

function M.setup()
	local status, nvimtree = pcall(require, 'nvim-tree')
	if not status then return end

	nvimtree.setup {
		disable_netrw = true,
		hijack_netrw = true,
		view = {
			number = true,
			relativenumber = true,
			width = 40
		},
		filters = {
			custom = { '.git' }
		}
	}
end

return M

