vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "NvimTree*",
    callback = function ()

    local api = require("nvim-tree.api")
    vim.keymap.set('n', 'l', api.node.open.edit)
end})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "NvimTree*",
    callback = function ()
    pcall(vim.cmd, "unmap l")
end})
