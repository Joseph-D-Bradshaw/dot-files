local nvimtree = require('nvim-tree')

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
    },
    update_focused_file = {
        enable = true
    }
}

