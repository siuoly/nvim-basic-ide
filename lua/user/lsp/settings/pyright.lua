-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        -- autoSearchPaths = true,
<<<<<<< HEAD
        diagnosticMode = "openFilesOnly", -- "workspace",
=======
        diagnosticMode = "openFilesOnly",--"workspace",
>>>>>>> 221823949d2cbd838652045f840293811bf86b14
        useLibraryCodeForTypes = false
      },
      pythonPath = "python3",
    },
  },
  filetypes = {"python"}
}
