local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "boran.lsp.mason"
require("boran.lsp.handlers").setup()
require "boran.lsp.null-ls"
