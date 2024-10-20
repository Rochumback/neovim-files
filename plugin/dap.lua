local dap = require("dap")

dap.configurations.rust = {
    type =  "rust";
    requestn = "launch";
    name = "launch file";
    program = "${file}";
    rustPath = function()
        return 
    end
}

