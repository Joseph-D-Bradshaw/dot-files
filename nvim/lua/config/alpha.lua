local M = {}

function M.setup()
	local status, alpha = pcall(require, 'alpha')
	if not status then return end

	local dashboard = require('alpha.themes.dashboard')
	local function header()
		return {
			[[                                      ]],
			[[	,-_/                 .   .      ]],
			[[	'  | ,-. ,-. ,-. ,-. |-. ' ,-.  ]],
			[[	   | | | `-. |-' | | | |   `-.  ]],
			[[	   | `-' `-' `-' |-' ' '   `-'  ]],
			[[	/` |             |              ]],
			[[	`--'             '              ]],
			[[	,--,--'                         ]],
			[[	`- | ,-. ,-. ,-,-.              ]],
			[[	 , | |-' |   | | |              ]],
			[[	 `-' `-' '   ' ' '              ]],
			[[                                      ]],
		}
	end

	dashboard.section.header.val = header()

	dashboard.section.buttons.val = {
		dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
		dashboard.button('c', '  Configuration (defaults.lua)', ':e $MYVIMRC <CR>'),
		dashboard.button('p', '  Plugins (plugins.lua)', ':e $HOME/.config/nvim/lua/plugins.lua<CR>'),
		dashboard.button('P', '  Plugins Configuration (lua/config/*)', ':Telescope file_browser<CR><ESC>'),
		dashboard.button('q', "  Quit", ":qa<CR>")
	}

	-- If computer uses kitty term
	local kitty_conf_path = vim.fn.expand("~/.config/kitty/kitty.conf")

	if vim.fn.filereadable(kitty_conf_path) == 1 then
		local kitty_button = dashboard.button('k', '  Kitty Configuration (kitty.conf)', ':e $HOME/.config/kitty/kitty.conf<CR>')
		table.insert(dashboard.section.buttons.val, #dashboard.section.buttons.val - 1, kitty_button)
	end

	local function footer()
		-- Number of plugins
		local total_plugins = #vim.tbl_keys(packer_plugins)
		local datetime = os.date '%d-%m-%Y  %H:%M:%S'
		local plugins_text = '\t' .. total_plugins .. ' plugins  ' .. datetime

		-- Quote
		local fortune = require('alpha.fortune')
		local quote = table.concat(fortune(), '\n')

		return plugins_text .. '\n' .. quote
	end

	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.h1 = 'Constant'
	dashboard.section.header.opts.h1 = 'Include'
	dashboard.section.buttons.opts.h1 = 'Function'
	dashboard.section.buttons.opts.h1_shortcut = 'Type'
	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.opts)
end

return M

