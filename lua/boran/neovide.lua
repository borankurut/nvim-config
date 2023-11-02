if vim.g.neovide then
	vim.opt.guifont = { "JetBrains Mono", ":h12" }
	vim.g.remember_window_size = true
	vim.g.remember_window_position = true


	local function toggle_fullscreen()
		if vim.g.neovide_fullscreen == false then
			vim.cmd "let g:neovide_fullscreen=v:true"
		else
			vim.cmd "let g:neovide_fullscreen=v:false"
		end
	end

	vim.g.neovide_transparency = 0.88
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_trail_size = 0.5

	vim.g.neovide_fullscreen = true
	vim.keymap.set("n", "<A-Enter>", toggle_fullscreen, { silent = true })
	--[[ vim.keymap.set("n", "<C-j>", "<Nop>", { silent = true }) ]]
	--[[ vim.keymap.set("n", "<C-k>", "<Nop>", { silent = true }) ]]
	--[[]]
	--[[ vim.keymap.set("n", "<C-k>", "<C-u>", { silent = true }) ]]
	--[[ vim.keymap.set("n", "<C-j>", "<C-d>", { silent = true }) ]]

	vim.g.neovide_refresh_rate = 165

	-- Change working directory to the home directory
	--vim.api.nvim_command('cd ~/codes/')
end
