vim.cmd('syntax enable')
vim.cmd([[
  augroup TodoHighlight
    autocmd!

    autocmd FileType text syntax region TodoDone start="^\s*\[\s*[xX]\s*\]" end="\n\n" contains=@TodoDone

    autocmd FileType text syntax region TodoPending start="^\s*\[\s* \s*\]" end="\n\n" contains=@TodoPending

    autocmd FileType text syntax region TodoInProgress start="^\s*\[\s*-\s*\]" end="\n\n" contains=@TodoInProgress

  augroup END
]])

vim.cmd([[
  augroup TodoTheme
    autocmd!
    autocmd FileType text highlight link TodoDone Comment
    autocmd FileType text highlight link TodoPending Keyword
    autocmd FileType text highlight link TodoInProgress Constant
  augroup END
]])
