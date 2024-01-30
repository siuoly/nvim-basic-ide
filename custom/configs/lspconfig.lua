local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd","pyright","rust_analyzer"} --,"pylyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
lspconfig.pyright.setup {
  -- need for key mapping 
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        -- autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",--"workspace",
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = "none",
          reportOptionalMemberAccess = "none",
          reportOptionalSubscript = "none",
          reportPrivateImportUsage = "none",
        },
        autoImportCompletions = false,
      },
      pythonPath = "python3",
      linting = {pylintEnabled = false},
    },
  },
  filetypes = {"python"},
}
