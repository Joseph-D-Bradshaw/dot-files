local alpha = require('alpha')

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
    dashboard.button('p', '  Plugins (init.lua)', ':e $HOME/.config/nvim/init.lua<CR>'),
    dashboard.button('P', '  Plugins Configuration (lua/plugins/*)', ':e $HOME/.config/nvim/lua/plugins<CR>'),
    dashboard.button('q', "  Quit", ":qa<CR>")
}

local function footer()
    -- Number of plugins
    -- local total_plugins = #vim.tbl_keys(packer_plugins)
    local total_plugins = #vim.tbl_keys(require('lazy.core.config').plugins)
    local datetime = os.date '%d-%m-%Y  %H:%M:%S'
    local plugins_text = '\t' .. total_plugins .. ' plugins 󰖷 ' .. datetime

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

