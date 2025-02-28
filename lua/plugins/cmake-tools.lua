return {
    "Civitasv/cmake-tools.nvim",
    lazy = false,
    init = function()
        vim.keymap.set(
            "n",
            "<Leader>mb",
            "<cmd>CMakeBuild<cr>",
            { noremap = true, silent = true, desc = "CMake Build" }
        )

        vim.keymap.set("n", "<Leader>mr", "<cmd>CMakeRun<cr>", { noremap = true, silent = true, desc = "CMake Run" })

        vim.keymap.set(
            "n",
            "<Leader>mg",
            "<cmd>CMakeGenerate<cr>",
            { noremap = true, silent = true, desc = "CMake Generate" }
        )
    end,
}
