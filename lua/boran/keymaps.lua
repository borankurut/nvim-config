local opts = { noremap = true, silent = true }

local term_ops = { silent = true }

local keymap = vim.api.nvim_set_keymap

--make leader key space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

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

-- telescope
--vim.keymap.set("n", "<leader>j", builtin.find_files, {})
--vim.keymap.set("n", "<leader>J", builtin.git_files, {})
--vim.keymap.set("n", "<leader>f", builtin.live_grep, {})
keymap("n", "<leader>j", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>J", "<cmd>lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)


--paste won't copy
keymap("v", "p", '"_dP', opts)
