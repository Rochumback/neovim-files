vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 12

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')
vim.api.nvim_buf_create_user_command(0, "NvimTreeOpen", function()
    require("nvim-tree.api").node.edit.open()
end, {})

vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format { async = true }
end, opts)
