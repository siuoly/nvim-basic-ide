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
require "user.treesitter-textobjects"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.illuminate"
require "user.indentline"
-- require "user.alpha"
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
--
--
--
-- diagnostic: text show on the editor, content provide by linter,...
-- linter: (1)syntax error,and (2)style non-apropreate, before running(language without compiler tool), it is a program,e.g. sumneko_lua, pyright
-- Formatter: after linter show style error, using `formatter` to fix error. e.g. yapf, autopep8, black(python)

-- null-ls plugin: all the things like formatter,autocomplete,linter,code_actions,diagnostic,hover...,but it is not a lsp server.
--             the same level with other lsp server, like pyright, and this null-ls call linter,formatter,code_actions for lsp feature.

-- mason.nvim plugin: packagemanger supports DAP servers, linters, formatters, and more. Very useful.

-- lsp-config. setting lsp feature, generally setting lsp-server, mapping.
--    local lsoconfig = require("lsp-config")
--    lspconfig.pyright.setup()
--    lspconfig.tsserver.setup()
--
--   But now combine it with "mason", "null-ls", "handler" for easy setting
--


-------------------------
-- TODO
-- Native lsp setting
-- [o]lsp-config setting
-- mason-lsp-config setting
-- dictionary
--
-- --------------------
-- LSP help
-- attach,  detach, 
 
