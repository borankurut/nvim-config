local opts = { noremap = true, silent = true }

local term_ops = { silent = true }

local keymap = vim.api.nvim_set_keymap

--make leader key space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

--[[ keymap("n", "<C-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<C-k>", "<C-w>k", opts) ]]

--buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Leader>w", ":Bdelete<CR>", opts)

--file navigation
keymap("n", "<C-k>", "<C-u>", opts)
keymap("n", "<C-j>", "<C-d>", opts)
keymap("v", "<C-k>", "<C-u>", opts)
keymap("v", "<C-j>", "<C-d>", opts)

--explorer window
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

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

-- Remap delete commands to use the black hole register
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })


--prettier
vim.keymap.set("n", "<leader>p", vim.lsp.buf.format)

--save file by leader s.
keymap("n", "<leader>s", ":w<cr>", opts)

--redo 
keymap("n", "r", "<C-r>", opts)

keymap("n", "<leader>v", ":vsplit<cr>", opts)

