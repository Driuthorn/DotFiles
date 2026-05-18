local wk = require("which-key")

wk.init = function() 
    vim.o.timeout = true
    vim.o.timeoutlen = 500
end
