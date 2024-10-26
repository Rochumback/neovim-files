return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")

        dap.adapters.lldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "/home/rochumback/Desktop/extension/adapter/codelldb",
                args = { "--port", "${port}" }
            }
        }

        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false
            }
        }

        require("dapui").setup()
    end,
}
