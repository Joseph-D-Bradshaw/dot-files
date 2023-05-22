local M = {}

function M.setup()
	local status, telescope = pcall(require, 'telescope')
	if not status then return end

	telescope.setup {
		extensions = {
			file_browser = {
				theme = 'ivy',
				hijack_netrw = true,
			}
		}
	}

	telescope.load_extension 'file_browser'
end

return M

