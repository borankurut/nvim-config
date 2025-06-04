local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

-- 1) Setup toggleterm
toggleterm.setup({
	size            = 20,
	--	open_mapping    = [[<M-;>]], -- Alt+; opens PowerShell by default
	start_in_insert = true, -- go straight to insert mode
	insert_mappings = true,
	direction       = "horizontal",
	close_on_exit   = true,

	-- hide the statusline in terminal
	on_open         = function()
		vim.opt.laststatus = 0
	end,
	on_close        = function()
		vim.opt.laststatus = 2
	end,

	-- default shell for the “normal” toggle
	shell           = "pwsh",

	hide_numbers    = true,
	shade_terminals = true,
	shading_factor  = 2,
	float_opts      = {
		border     = "curved",
		winblend   = 0,
		highlights = { border = "Normal", background = "Normal" },
	},
})

local Terminal = require("toggleterm.terminal").Terminal

-- 2) Define the two terminals (hidden by default)
local powershell = Terminal:new({
	cmd       = "pwsh",
	hidden    = true,
	direction = "horizontal",
})

local vs_dev = Terminal:new({
	cmd       =
	[[pwsh -NoExit -Command "cmd /c '\"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\Build\\vcvarsall.bat\" x64'"]],
	hidden    = true,
	direction = "horizontal",
})

-- 3) Keep track of which one is open
_G.current_term = nil

function _PWSH_TOGGLE()
	if _G.current_term then _G.current_term:close() end
	if _G.current_term ~= powershell then
		powershell:toggle()
		_G.current_term = powershell
	else
		_G.current_term = nil
	end
end

function _VSVSCMD_TOGGLE()
	if _G.current_term then _G.current_term:close() end
	if _G.current_term ~= vs_dev then
		vs_dev:toggle()
		_G.current_term = vs_dev
	else
		_G.current_term = nil
	end
end

-- 4) Map Alt+; and Alt+l in both NORMAL and TERMINAL modes
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "t" }, "<M-;>", [[<C-\><C-n>:lua _VSVSCMD_TOGGLE()<CR>]], opts)
vim.keymap.set({ "n", "t" }, "<M-'>", [[<C-\><C-n>:lua _PWSH_TOGGLE()<CR>]], opts)
vim.cmd([[
  augroup TerminalInsertEscape
    autocmd!
    autocmd TermOpen * lua SetTerminalEscapeMappings()
  augroup END
]])

function SetTerminalEscapeMappings()
	local opts = { noremap = true, silent = true, buffer = 0 }
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)
end
