return {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
        "akinsho/toggleterm.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = function()
        require("toggleterm").setup({
            size = 15 or function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,

            shade_terminals = true,
            shading_factor = 20,
            insert_mappings = true,
            persist_size = true,
            persist_mode = true,
            auto_scroll = true,

            float_opts = {
                border = 'curved',
                winblend = 0,
                title_pos = 'center'
            },
        })


        local manager = require("toggleterm-manager")
        local actions = manager.actions

        manager.setup({
            mappings = {                                                                  -- key mappings bound inside the telescope window
                i = {
                    ["<CR>"] = { action = actions.toggle_term, exit_on_action = true },   -- toggles terminal open/closed
                    ["<C-i>"] = { action = actions.create_term, exit_on_action = true },  -- creates a new terminal buffer
                    ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
                    ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
                },
            },
            titles = {
                preview = "Preview", -- title of the preview buffer in telescope
                prompt = " Terminals", -- title of the prompt buffer in telescope
                results = "Results", -- title of the results buffer in telescope
            },
            results = {
                fields = { -- fields that will appear in the results of the telescope window
                    "term_icon", -- a terminal icon
                    "term_name", -- toggleterm's display_name if it exists, else the terminal's id assigned by toggleterm
                },
                separator = " ", -- the character that will be used to separate each field provided in results.fields
                term_icon = "", -- the icon that will be used for term_icon in results.fields
            },
        })

        function set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
