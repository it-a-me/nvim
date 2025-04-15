return {
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      hints = {
        constantValues = true,
        assignVariableTypes = true,
        compositeLiteralFields = true,
      },
      codelenses = {
        test = true
      }
    }
  }
}
