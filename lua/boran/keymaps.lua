local opts = { noremap = true, silent = true }

local term_ops = { silent = true }

local keymap = vim.api.nvim_set_keymap

--make leader key space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--explorer window
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

--escape jk
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

--visual indent
keymap("v", "<TAB>", ">gv", opts)
keymap("v", "<S-TAB>", "<gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

--paste won't copy
keymap("v", "p", '"_dP', opts)

