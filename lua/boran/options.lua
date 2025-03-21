-- :help options

-- creates .clangd file that includes all the folders(and subfolders) inside src folder if src folder exist in the current folder.
vim.api.nvim_command("command! IncludeHeaders lua require('boran.clangdinclude').generate_clangd_file()")
vim.api.nvim_command("command! IncludeHeadersAll lua require('boran.clangdinclude').include_all_directories()")

--opacity and some ruler stuf
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalF", { bg = "none" })

vim.opt.laststatus = 2
vim.opt.ruler = false
vim.opt.number = false

vim.cmd('syntax off')

vim.cmd [[
  highlight StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StatusLineNC guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

  autocmd CursorMoved * set nohlsearch
  nnoremap n n:set hlsearch<cr>

  set guicursor=n-v-c-i:block
]]

-- remove ~
vim.opt.fillchars = { eob = ' ' }

--reduce sign column size
vim.o.signcolumn = "number"

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus" --for ctrl-c and v to work.
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
--vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.undofile = true  -- records history, don't do frequent changes to large files

vim.opt.updatetime = 750 -- solves syntax glitches?

vim.opt.expandtab = false
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.o.autochdir = false

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.wrap = false

vim.opt.cursorline = true

vim.g.loaded_matchparen = 1

--set the hexadecimal color for line highlighting
vim.cmd [[
    hi CursorLine ctermbg=20 guibg=#1f1f1f
]]

local M = {}

function M.after_colorscheme()
	vim.cmd [[
        hi CursorLine ctermbg=20 guibg=#161616
		highlight StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
		highlight StatusLineNC guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
    ]]

	if vim.g.neovide then
		vim.cmd [[highlight Normal guibg=#000000]]
		vim.cmd [[highlight NvimTreeNormal guibg=#000000]]
	end
	-- change background to black because neovide goes weird
end

M.after_colorscheme()

-- Autocommand to run the function when colorscheme changes
vim.cmd [[
    augroup CursorLineHighlight
        autocmd!
        autocmd ColorScheme * lua require('boran.options').after_colorscheme()
    augroup END
]]

return M
