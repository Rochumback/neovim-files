-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
        folders_first = true,
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

require 'nvim-web-devicons'.setup {
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    },
    color_icons = true,
    default = true,
    strict = true,
    variant = "dark",
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
    },
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
    },
}
