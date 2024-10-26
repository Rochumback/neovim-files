--package.path = ";" .. io.popen("realpath .."):read()

--require("config")

function setColor(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)


    -- Don't using this options while not set up the alacritty background
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none"} )
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"} )
end

setColor(color)
