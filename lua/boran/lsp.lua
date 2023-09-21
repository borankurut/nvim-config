local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set('n', 'gk', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	vim.keymap.set('n', 'gl', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
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

