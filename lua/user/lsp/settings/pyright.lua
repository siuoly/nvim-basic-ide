return {
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
  filetypes = {"python"}
}
