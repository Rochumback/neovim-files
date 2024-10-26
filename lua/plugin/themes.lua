return {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
        "rose-pine/neovim",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        color = color or "catppuccin-macchiato"
        vim.cmd.colorscheme(color)


        -- Don't using this options while not set up the alacritty background
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none"} )
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"} )
    end
}
