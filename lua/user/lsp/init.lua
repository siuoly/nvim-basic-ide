local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")  -- lsp-server, mason-ui, setting lsp-config, require below handler
require("user.lsp.handlers").setup()  -- lsp-keymap, diagnostic-symbol, 
require("user.lsp.null-ls")  -- diagnostic, formatter manager
