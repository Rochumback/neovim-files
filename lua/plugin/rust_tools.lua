return {
    "simrat39/rust-tools.nvim",
    lazy = false,
    config = function()
        local rust_tools = require("rust-tools")
        rust_tools.setup({})
    end
}
