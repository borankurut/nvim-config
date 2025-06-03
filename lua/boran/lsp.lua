require('neodev').setup()
require('mason').setup({})

require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'clangd', 'pyright', 'mesonlsp' },
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		clangd = function()
			require('lspconfig').clangd.setup({
				cmd = { "clangd", "--header-insertion=never" }
			})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup(
				require('lsp-zero').nvim_lua_ls()
			)
		end
	}
})

-- Disable automatic keymaps here!
local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = false, -- CRITICAL CHANGE
	manage_nvim_cmp = true,
	suggest_lsp_servers = false
})

-- All keymaps defined manually
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- Diagnostics
	vim.keymap.set('n', 'gk', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

	-- Navigation
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

	-- Actions
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
end)

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '✘',
			[vim.diagnostic.severity.WARN] = '▲',
			[vim.diagnostic.severity.INFO] = '»',
			[vim.diagnostic.severity.HINT] = '⚑'
		}
	},
	virtual_text = {
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = '✘',
				[vim.diagnostic.severity.WARN] = '▲',
				[vim.diagnostic.severity.INFO] = '»',
				[vim.diagnostic.severity.HINT] = '⚑'
			}
			return icons[diagnostic.severity]
		end,
		spacing = 2
	},
	update_in_insert = false
})

require('fidget').setup()
