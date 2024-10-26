local remaps = {
    vim_remaps = function()
        --vim remaps
        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

        vim.keymap.set("n", '<C-h>', '<C-w>h')
        vim.keymap.set("n", '<C-j>', '<C-w>j')
        vim.keymap.set("n", '<C-k>', '<C-w>k')
        vim.keymap.set("n", '<C-l>', '<C-w>l')
        --vim remaps
    end,

    telescope_remaps = function()
        -- telescope remaps
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pb", builtin.buffers, {})

        vim.keymap.set("n", "<leader>pg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        -- telescope remaps
    end,
    nvim_tree_remais = function()
        -- nvim tree remaps
        vim.keymap.set("n", "<leader>e", function()
            vim.cmd(":NvimTreeFindFileToggle")
        end)
        -- nvim tree remaps
    end,
    lsp_remaps = function()
        --lsp remaps
        vim.keymap.set("n", '<leader>lf', function()
            vim.lsp.buf.format({ async = true })
        end)

        vim.keymap.set("n", '<leader>lr', function()
            vim.lsp.buf.rename()
        end)

        vim.keymap.set("n", 'gd', function()
            vim.lsp.buf.definition()
        end)
        --lsp remaps
    end,
    terminal_remaps = function()
        --terminal remaps
        vim.keymap.set({ "n", "t" }, "<A-1>", function()
            vim.cmd(":Telescope toggleterm_manager")
        end)

        vim.keymap.set({ "n", "t" }, "<A-2>", function()
            vim.cmd(":ToggleTerm direction=vertical size=75")
        end)

        vim.keymap.set({ "n", "t" }, "<A-3>", function()
            vim.cmd("tabnew term://zsh")
        end)
        vim.keymap.set({ "n", "t" }, "<A-b>", function()
            vim.cmd("tabnext")
        end)
        --terminal remaps
    end,
}

function remaps.all()
    for key, func in pairs(remaps) do
        if key ~= "all" then
            func()
        end
    end
end

return remaps
