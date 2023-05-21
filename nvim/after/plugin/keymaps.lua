local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Center search results
keymap('n', 'n', 'nzz', default_opts)
keymap('n', 'N', 'Nzz', default_opts)

-- Visual line wraps
keymap('n', 'k', 'v:count == 0 ? "gk" : "k"', expr_opts)
keymap('n', 'j', 'v:count == 0 ? "gj" : "j"', expr_opts)

-- Better indent (keeps highlight for repeated indenting)
keymap('v', '<', '<gv', default_opts)
keymap('v', '>', '>gv', default_opts)

-- Paste over selected text without yanking it
keymap('v', 'p', '"_dP"', default_opts)

-- Switch buffer (shift+h, shift+l)
keymap('n', '<S-h>', ':bprevious<CR>', default_opts)
keymap('n', '<S-l>', ':bnext<CR>', default_opts)

-- Cancel search highlighting with ESC
keymap('n', '<ESC>', ':nohlsearch<BAR>:echo<CR>', default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap('n', '<leader>wh', ':vertical resize +2<CR>', { desc = 'resize window left', unpack(default_opts) })
keymap('n', '<leader>wl', ':vertical resize -2<CR>', { desc = 'resize window right', unpack(default_opts) })
keymap('n', '<leader>wk', ':resize -2<CR>', { desc = 'resize window up', unpack(default_opts) })
keymap('n', '<leader>wj', ':resize +2<CR>', { desc = 'resize window down', unpack(default_opts) })

