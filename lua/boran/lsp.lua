-- LSP Setup (Neovim 0.11+)

-- 1. Neodev for enhanced Lua support (setup before LSP configs)
require('neodev').setup({}) -- (optional but recommended if you edit Neovim config in Lua)

-- 2. Mason and Mason-Lspconfig initialization
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "clangd", "pyright", "mesonlsp", "glsl_analyzer" },
	automatic_enable = false, -- we'll manually enable after setting configs
})

-- 3. nvim-cmp setup for autocompletion
local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<CR>']    = cmp.mapping.confirm({ select = true }), -- Enter to confirm
		['<Tab>']   = cmp.mapping.select_next_item(),   -- Tab to next item
		['<S-Tab>'] = cmp.mapping.select_prev_item(),   -- Shift-Tab to prev
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'buffer' }, { name = 'path' }, etc. (add other sources as needed)
	})
})

-- 4. LSP client capabilities and on_attach function
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- Diagnostics keymaps
	vim.keymap.set('n', 'gk', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	-- Navigation keymaps
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	-- Actions
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
	-- (You can add more keybindings here or conditionally for certain servers)
end

-- 5. Define LSP server configurations using vim.lsp.config
vim.lsp.config("clangd", {
	cmd = { "clangd", "--header-insertion=never", "--header-insertion-decorators=0" },
	capabilities = lsp_capabilities,
	on_attach = lsp_on_attach,
	-- filetypes, root_dir, etc. will use defaults from lspconfig
})
vim.lsp.config("lua_ls", {
	capabilities = lsp_capabilities,
	on_attach = lsp_on_attach,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false }, -- avoid prompting about third-party
			telemetry = { enable = false },
		}
	}
	-- (Neodev will auto-add Neovim runtime; no need to specify library manually)
})
vim.lsp.config("pyright", { capabilities = lsp_capabilities, on_attach = lsp_on_attach })
vim.lsp.config("meson", { capabilities = lsp_capabilities, on_attach = lsp_on_attach })
vim.lsp.config("glsl_analyzer", { capabilities = lsp_capabilities, on_attach = lsp_on_attach })

-- 6. Enable the LSP servers
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("mesonlsp")
vim.lsp.enable("glsl_analyzer")

-- 7. Configure diagnostics (signs and virtual text icons)
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN]  = "▲",
			[vim.diagnostic.severity.INFO]  = "»",
			[vim.diagnostic.severity.HINT]  = "⚑",
		},
	},
	virtual_text = {
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = "✘",
				[vim.diagnostic.severity.WARN]  = "▲",
				[vim.diagnostic.severity.INFO]  = "»",
				[vim.diagnostic.severity.HINT]  = "⚑",
			}
			return icons[diagnostic.severity]
		end,
		spacing = 2,
	},
	update_in_insert = false,
})

-- 8. Initialize fidget for LSP status UI
require("fidget").setup({})
