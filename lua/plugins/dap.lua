return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local rustc_sysroot = vim.fn.system("rustc --print sysroot"):gsub("\n", "")

        dap.adapters.rust_lldb = {
            type = "executable",
            command = "lldb-dap-18",
            name = "rust_lldb",
        }

        dap.configurations.rust = {
            {
                name = "Launch Rust Executable",
                type = "rust_lldb",
                request = "launch",
                program = function()
                    return vim.fn.input({
                        prompt = "Path to executable: ",
                        default = vim.fn.getcwd() .. "/",
                        completion = "file",
                    })
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
    end,
}
