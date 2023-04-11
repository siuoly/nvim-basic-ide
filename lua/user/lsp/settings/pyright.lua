-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        -- autoSearchPaths = true,
        -- diagnosticMode = "workspace",
        -- useLibraryCodeForTypes = true
      },
      pythonPath = "python",
    },
  },
  filetypes = {"python"}
}
