local M = {}

function M.setup()
	local indentblankline = require('ibl')

	-- :h indent_blankline.txt for setup options
	indentblankline.setup {
		show_current_context = true,
		show_current_context_start = true,
	}
end

return M

