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
vim.opt.undofile = true -- records history, don't do frequent changes to large files

vim.opt.updatetime = 300

vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.o.autochdir = false

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.wrap = false

vim.opt.cursorline = true

--set the hexadecimal color for line highlighting
vim.cmd [[
    hi CursorLine ctermbg=20 guibg=#1f1f1f
]]

local M = {}

function M.after_colorscheme()
    local current_colorscheme = vim.fn.execute('colorscheme'):match('([^%s]+)')
    local new_line = "vim.cmd('colorscheme " .. current_colorscheme .. "')"


	local init_lua_path = vim.fn.stdpath('config') .. '/init.lua'
    local init_lua_lines = vim.fn.readfile(init_lua_path)

    for i, line in ipairs(init_lua_lines) do
        if line:find("colorscheme") and not line:find("%-%-") then
            init_lua_lines[i] = new_line
            break
        end
    end


    vim.fn.writefile(init_lua_lines, init_lua_path)

    vim.cmd [[
        hi CursorLine ctermbg=20 guibg=#161616
		highlight StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
		highlight StatusLineNC guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
    ]]
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

