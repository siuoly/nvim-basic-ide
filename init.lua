require "user.impatient"
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.illuminate"
require "user.indentline"
require "user.alpha"
require "user.lsp"
require "user.dap"
-- 語法教學
-- vim.diagnostic.config({ virtual_text = true, signs=false })
--*vim.diagnostic.disable()*
-- 1    vim.diagnostic.severity.ERROR
-- 2    vim.diagnostic.severity.WARN
-- 3    vim.diagnostic.severity.INFO
-- 4    vim.diagnostic.severity.HINT


--
-- mason:
--   file: user.lsp.settings.handler 
--   diagnostic symbol
--   hover , signature setting
--   keymap:
--     definition, declaration, hover, implementation, reference, diagnostic... default vim lsp function
