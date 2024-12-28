return {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
        "rose-pine/neovim",
        "nvim-tree/nvim-web-devicons",
        "RedsXDD/neopywal.nvim",
        "AlexvZyl/nordic.nvim",
    },

    config = function()
        require("neopywal").setup({
            use_palette = "catppuccin-mocha",
            terminal_colors = true,
            show_split_lines = true,
            styles = {
                booleans = { "italic" },
                operators = { "bold" },
            },
            show_end_of_buffer = false,
            -- For more plugin options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Plugins)
        })

        require('nordic').setup({
            after_palette = function(palette) end,
            -- This callback can be used to override highlights before they are applied.
            on_highlight = function(highlights, palette) end,
            -- Enable bold keywords.
            bold_keywords = true,
            -- Enable italic comments.
            italic_comments = true,
            -- Enable brighter float border.
            bright_border = true,
            -- Reduce the overall amount of blue in the theme (diverges from base Nord).
            reduced_blue = true,
            -- Swap the dark background with the normal one.
            swap_backgrounds = false,
            -- Cursorline options.  Also includes visual/selection.
            cursorline = {
                -- Bold font in cursorline.
                bold = false,
                -- Bold cursorline number.
                bold_number = true,
                -- Available styles: 'dark', 'light'.
                theme = 'light',
                -- Blending the cursorline bg with the buffer bg.
                blend = 0.85,
            },
            noice = {
                -- Available styles: `classic`, `flat`.
                style = 'classic',
            },
            telescope = {
                -- Available styles: `classic`, `flat`.
                style = 'classic',
            },
            leap = {
                -- Dims the backdrop when using leap.
                dim_backdrop = true,
            },
            ts_context = {
                -- Enables dark background for treesitter-context window
                dark_background = true,
            }
        })

        color = color or "catppuccin-mocha"
        vim.cmd.colorscheme(color)

        -- Don't using this options while not set up the alacritty background
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none"} )
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"} )
    end
}
