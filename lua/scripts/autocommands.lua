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

vim.api.nvim_create_augroup("RetabSettings", {clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "RetabSettings",
    pattern = "*",
    callback = function ()
        vim.opt_local.expandtab = false
        vim.cmd("retab! 4")
    end
})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "RetabSettings",
    pattern = "*",
    callback = function ()
        vim.opt_local.expandtab = true
        vim.cmd("retab! 4")
    end
})
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "RetabSettings",
    pattern = "*",
    callback = function ()
        vim.opt_local.expandtab =false
        vim.cmd("retab! 4")
    end
})
