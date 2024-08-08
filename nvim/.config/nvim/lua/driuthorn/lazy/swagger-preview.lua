return {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
    config = function()
        local swaggerPrev = require("swagger-preview");

        swaggerPrev.setup({
            port = 8000,
            host = "localhost",
        })
    end
}
