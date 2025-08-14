require "boran.plugins"

require "boran.options"
require "boran.commands"
require "boran.lsp"
require "boran.telescope"
require "boran.treesitter"
-- TODO: solve highlighting lag.
require "boran.autopairs"
require "boran.comment"
require "boran.gitsigns"
require "boran.keymaps"
require "boran.neo-tree"
require "boran.toggleterm"
require "boran.illuminate"
require "boran.matchparen"
require "boran.rosepine"
require "boran.vague"
require "boran.neovide"

vim.cmd('colorscheme vague')
--[[ vim.cmd('colorscheme rose-pine') ]]
