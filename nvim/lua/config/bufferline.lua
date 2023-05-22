local M = {}

function M.setup()
	local status, bufferline = pcall(require, 'bufferline')
	if not status then return end

	options = {
		numbers = 'none',
		diagnostics = 'nvim_lsp',
		separator_style = 'slant' or 'padded_slant',
		show_tab_indicators = true,
		show_buffer_close_icons = false,
		show_close_icon = false
	}

	bufferline.setup {
		options = options
	}
end

return M

