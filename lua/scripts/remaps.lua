--vim maps start
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", '<C-h>', '<C-w>h')
vim.keymap.set("n", '<C-j>', '<C-w>j')
vim.keymap.set("n", '<C-k>', '<C-w>k')
vim.keymap.set("n", '<C-l>', '<C-w>l')
--vim maps start

-- telescope maps start
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})

vim.keymap.set("n", "<leader>pg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- telescope maps end

-- nvim tree maps start


vim.keymap.set("n", "<leader>e", function()
    vim.cmd(":NvimTreeFindFileToggle")
end)
-- nvim tree maps end

--lps maps start
vim.keymap.set("n", '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
end)

vim.keymap.set("n", '<leader>lr', function()
    vim.lsp.buf.rename({ async = true })
end)

vim.keymap.set("n", 'gd', function()
    vim.lsp.buf.definition()
end)
--lps maps end

--terminal maps start
vim.keymap.set({ "n", "t" }, "<A-1>", function()
    vim.cmd(":Telescope toggleterm_manager")
end)

vim.keymap.set({ "n", "t" }, "<A-2>", function()
    vim.cmd(":ToggleTerm direction=vertical size=48")
end)
--terminal maps end
