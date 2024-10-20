local ostype = io.popen("uname"):read()
local files = nil

if ostype == "Linux" then
    files = io.popen("ls ~/.config/nvim/lua/scripts/ "):lines()
else
    files = io.popen("dir " .. os.getenv("appdata") .. "\\Local\\nvim\\lua\\scripts\\"):lines()
end

for i in files do
    module = string.gmatch(i, "[^%.]+")()
    if module ~= "init" then
        require("scripts." .. module)
    end
end
