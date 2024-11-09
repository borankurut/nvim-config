local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = {omit = {'<C-k>'}}, -- C-k used for navigation
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'lua_ls',
  'clangd',
  'pyright',
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }

    -- Configure signs for diagnostics
    vim.fn.sign_define("LspDiagnosticsSignError", { text = "✘", texthl = "LspDiagnosticsSignError" })
    vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "▲", texthl = "LspDiagnosticsSignWarning" })
    vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "»", texthl = "LspDiagnosticsSignInformation" })
    vim.fn.sign_define("LspDiagnosticsSignHint", { text = "⚑", texthl = "LspDiagnosticsSignHint" })

    -- Show diagnostics in virtual text
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = function(diagnostic)
					if diagnostic.severity == vim.diagnostic.severity.ERROR then
						return '✘'
					elseif diagnostic.severity == vim.diagnostic.severity.WARN then
						return '▲'
					elseif diagnostic.severity == vim.diagnostic.severity.INFO then
						return '»'
					else
						return '⚑'
					end
				end,

                spacing = 2,
            },
            signs = true,
            update_in_insert = false,
        }
    )

    -- Add keybindings
    vim.keymap.set('n', 'gk', '<cmd>lua vim.diagnostic.open_float({ focusable = true })<cr>', opts)
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    -- more keybindings...
end)

lsp.nvim_workspace()

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»',
})

lsp.configure('clangd', {
	cmd = { "clangd", "--header-insertion=never"}
})

lsp.setup()
