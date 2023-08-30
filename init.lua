vim.cmd "colorscheme gruvbox"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalF", { bg = "none" })
vim.opt.laststatus = 2
vim.opt.ruler = false
vim.opt.number = false

vim.cmd [[
  highlight StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StatusLineNC guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
]]
vim.o.signcolumn = "number" 

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
require "boran.bufferline"
require "boran.rainbow-delimiters"

