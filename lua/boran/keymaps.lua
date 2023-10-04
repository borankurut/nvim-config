local opts = { noremap = true, silent = true }

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

--file navigation

-- Create a custom function to execute zz and move 5 lines
function CenterAndMoveUp()
  vim.cmd('normal! zz')
  vim.cmd('normal! 5k')
end

function CenterAndMoveDown()
  vim.cmd('normal! zz')
  vim.cmd('normal! 5j')
end

keymap("n", "<C-k>", "<C-u>:lua CenterAndMoveUp()<CR>", opts)
keymap("n", "<C-j>", "<C-d>:lua CenterAndMoveDown()<CR>", opts)

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
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })


--prettier
vim.keymap.set("n", "<leader>p", vim.lsp.buf.format)

-- don't waste lines.
keymap("n", "<leader>[", ":PrettyCurly<CR>", opts)

--save file by leader s.
keymap("n", "<leader>s", ":w<cr>", opts)

--redo 
keymap("n", "r", "<C-r>", opts)

keymap("n", "<leader>v", ":vsplit<cr>", opts)

--tabs
keymap("n", "<leader>h", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>a", "<cmd>lua require'harpoon.mark'.add_file()<cr>", opts)

keymap("n", '<leader>1', "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", opts)
keymap("n", '<leader>2', "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", opts)
keymap("n", '<leader>3', "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", opts)
keymap("n", '<leader>4', "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", opts)
keymap("n", '<leader>5', "<cmd>lua require'harpoon.ui'.nav_file(5)<cr>", opts)
