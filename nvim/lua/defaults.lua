local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

opt.termguicolors = true        -- Enable colours in terminal
opt.hlsearch = true             -- Set highlight on search
opt.number = true               -- Make line numbers on by default
opt.relativenumber = true       -- Show relative line numbers
opt.mouse = 'a'                 -- Enable mouse mode
opt.breakindent	= true          -- Use indent of previous line as indent for new line
opt.undofile = true             -- Save undo history
opt.ignorecase = true           -- Case insensitive searching unless /C in search
opt.smartcase = true            -- Lower casing searching = case insensitive, with upper case = case sensitive
opt.updatetime = 1000           -- Decrease update time (default is 4000ms)
opt.signcolumn = 'yes'          -- Always show the sign column
opt.clipboard = 'unnamedplus'   -- Access system clipboard
opt.expandtab = true            -- Use spaces over tabs (don't like it, but to conform with work Prettier config)
opt.tabstop = 4                 -- Render tabs as four spaces
opt.shiftwidth = 4              -- Tabs indent by 4 spaces per tab press
opt.softtabstop = 4             -- Mixes spaces and tabs to get tab like behaviour with good indenting
opt.timeoutlen = 300            -- Time in ms to wait for a mapped sequence to complete

-- For path searching
opt.path:remove "/usr/include"              -- We don't want to look here
opt.path:append "**"                        -- Append to path everything in PWD
opt.wildignorecase = true                   -- Case insensitive search in :find etc
opt.wildignore:append "**/node_modules*"    -- Ignore node_modules in search
opt.wildignore:append "**/.git/*"           -- Ignore node_modules in search
opt.wildignore:append "**/.obsidian/*"      -- Ignore obsidian (notes metadata) in search
opt.wildignore:append "**/build*"           -- Ignore build output in search
opt.wildignore:append "**/pods*"            -- Ignore build output in search

-- Highlight on yank
vim.cmd [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight_on_yank()
    augroup end
]]

