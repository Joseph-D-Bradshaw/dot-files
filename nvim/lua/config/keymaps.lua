-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", 'v:count == 0 ? "gk" : "k"', expr_opts)
keymap("n", "j", 'v:count == 0 ? "gj" : "j"', expr_opts)

-- Better indent (keeps highlight for repeated indenting)
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over selected text without yanking it
keymap("v", "p", '"_dP"', default_opts)

-- Switch buffer (shift+h, shift+l)
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<BAR>:echo<CR>", default_opts)

keymap("i", "jj", "<ESC>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Escape terminal mode with the same key
keymap("t", "<C-\\><C-\\>", "<C-\\><C-n>", { desc = "escape terminal mode", unpack(default_opts) })

-- Buffer close, goes to previous bp then closes
keymap("n", "<leader>bc", "<cmd>bp|bd#<CR>", { desc = "Close current buffer", unpack(default_opts) })

-- Custom command added in lua/custom/commands.lua
keymap(
  "n",
  "<leader>ct",
  ":CompleteTask<CR>",
  { desc = "Adds completion tag with today's date on it", unpack(default_opts) }
)
