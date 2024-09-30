return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {
        layouts = {
            {
                elements = {},
                position = "left",
                size = 40,
            },
            {
                elements = {
                    {
                        id = "repl",
                        size = 0.5,
                    },
                },
                position = "bottom",
                size = 10,
            },
        },
    },
}
