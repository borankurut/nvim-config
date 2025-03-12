if vim.g.neovide then
	vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h12" }
	vim.g.remember_window_size = true
	vim.g.remember_window_position = true


	local function toggle_fullscreen()
		if vim.g.neovide_fullscreen == false then
			vim.cmd "let g:neovide_fullscreen=v:true"
		else
			vim.cmd "let g:neovide_fullscreen=v:false"
		end
	end

	vim.cmd('highlight Normal guibg=#000000')

	vim.g.neovide_transparency = 0.99
	vim.g.neovide_background_transparency = 0
	vim.g.neovide_background_image = "C:\\Users\\boran\\Pictures\\neovide\\q.jpg"
	--	vim.g.neovide_cursor_vfx_mode = "pixiedust"
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
	vim.api.nvim_command('cd ~')
end
