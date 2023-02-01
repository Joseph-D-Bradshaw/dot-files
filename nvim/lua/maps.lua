local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w') -- Space jumps to next window
keymap.set('', 's<left>', '<C-w>h') -- s then arrow key jumps to the left window relatively
keymap.set('', 's<up>', '<C-w>k') -- same but up
keymap.set('', 's<down>', '<C-w>j') -- same but down
keymap.set('', 's<right>', '<C-w>l') -- same but right
keymap.set('', 'sh', '<C-w>h') -- s then h key jumps to the left window relatively-
keymap.set('', 'sk', '<C-w>k') -- same but up
keymap.set('', 'sj', '<C-w>j') -- same but down
keymap.set('', 'sl', '<C-w>l') -- same but right

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
