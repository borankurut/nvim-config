local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set('n', 'gk', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	-- more keybindings...
end)

lsp.nvim_workspace()

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»',
})

lsp.setup()

