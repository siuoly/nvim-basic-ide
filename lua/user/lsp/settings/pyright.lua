-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        -- autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",--"workspace",
        useLibraryCodeForTypes = false
      },
      pythonPath = "python3",
    },
  },
  filetypes = {"python"}
}
