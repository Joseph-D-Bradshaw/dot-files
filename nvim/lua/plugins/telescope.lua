local telescope = require('telescope')

telescope.setup {
    extensions = {
        file_browser = {
            theme = 'ivy',
            hijack_netrw = true,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}

telescope.load_extension 'file_browser'
telescope.load_extension 'ui-select'

