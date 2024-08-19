vim.cmd([[
  command! Removem %s/\r//g
]])

vim.cmd([[
	command! PrettyCurly %s/)\(\s*\n\s*{\)/){/g
]])

