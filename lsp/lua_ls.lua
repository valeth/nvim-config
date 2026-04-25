return {
    settings = {
        Lua = {
            telemetry = { enable = false }
        }
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = false
                }
            }
        }
    }
}
