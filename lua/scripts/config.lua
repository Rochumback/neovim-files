-- color = "neopywal-dark"
color = 'nordic'

vim.opt.updatetime = 100
vim.diagnostic.config({ signs = false, })

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 12

vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = [[tab:◦◦•,space: ,nbsp:␣,trail:•,eol:↴,precedes:«,extends:»]]
vim.api.nvim_set_hl(0, "NonText", { bg = "white"} )
