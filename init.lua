require "boran.options"
require "boran.keymaps"
require "boran.plugins"
require	"boran.cmp"
require	"boran.commands"
require "boran.lsp"
require "boran.telescope"
require "boran.treesitter"
require "boran.autopairs"
require "boran.comment"
require "boran.gitsigns"
require "boran.nvim-tree"

vim.cmd "colorscheme gruvbox"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalF", { bg = "none" })

