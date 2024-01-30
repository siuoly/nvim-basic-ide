-- local autocmd = vim.api.nvim_create_autocmd
vim.g.python3_host_prog = "/home/siuoly/.pyenv/versions/default/bin/python"

-- require("custom.handler").setup()  -- lsp-keymap, diagnostic-symbol, 

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
autocmd("BufReadPost", {
  pattern = "*",
  command = "silent! loadview",
})
