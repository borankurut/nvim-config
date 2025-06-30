if vim.g.neovide then
	vim.opt.guifont = { "Iosevka Nerd Font Mono", ":h14" }
	vim.g.remember_window_size = true
	vim.g.remember_window_position = true


	local function toggle_fullscreen()
		if vim.g.neovide_fullscreen == false then
			vim.cmd "let g:neovide_fullscreen=v:true"
		else
			vim.cmd "let g:neovide_fullscreen=v:false"
		end
	end

	vim.g.neovide_background_transparency = 0.0
	vim.g.neovide_bgimage_opacity = 1.0
	vim.g.neovide_opacity = 0.85
	vim.g.opacity = 0.85

	vim.g.neovide_background_image =
	"C:\\Users\\boran\\AppData\\Roaming\\Microsoft\\Windows\\Themes\\TranscodedWallpaper"

	--[[ vim.g.neovide_cursor_vfx_mode = "pixiedust" ]]
	vim.g.neovide_cursor_trail_size = 0.5

	vim.g.neovide_fullscreen = true
	vim.keymap.set("n", "<A-Enter>", toggle_fullscreen, { silent = true })

	vim.g.neovide_refresh_rate = 165
end
