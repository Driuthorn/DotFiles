local blink = require("blink.cmp")
return {
    cmd = { "ngserver", "--stdio", "--tsProbeLocations", "../..,?/node_modules", "--ngProbeLocations", "../../@angular/language-server/node_modules,?/node_modules/@angular/language-server/node_modules", "--angularCoreVersion", "" },
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
    root_markers = {
        'angular.json',
        'nx.json',
    },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities(),
        {
            fileOperations = {
                didRename = true,
                willRename = true,
            },
        }
    ),
}
