local harpoon = require('harpoon')


harpoon:setup()

local conf = require('telescope.config').values

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
            results = file_paths
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({})
    }):find()
end

-- Harpoon menu that uses telescope
vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon telescope" })

-- Add an item to harpoon
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end,
    { desc = "Append buffer" })


-- Quick menu
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = 'Harpoon menu' })

-- Select by number
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
    { desc = 'Select harpoon 1' })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
    { desc = 'Select harpoon 2' })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
    { desc = 'Select harpoon 3' })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
    { desc = 'Select harpoon 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
    { desc = 'Previous buffer' })
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
    { desc = 'Next buffer' })

