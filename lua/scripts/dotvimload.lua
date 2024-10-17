local lines = io.popen([[ realpath ~/.config/nvim/dotvim/*]]):lines()
for dotvim in lines do
    vim.cmd.source(dotvim)
end
