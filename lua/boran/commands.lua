vim.cmd([[
  command! Removem %s/\r//g
]])

--prettier
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
