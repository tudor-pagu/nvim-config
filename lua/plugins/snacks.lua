return {
    "folke/snacks.nvim",
    opts = {
        picker = { enabled = false },  -- <- turn off Snacks picker
        styles = {
            terminal = {
                position = "bottom",
            },
        },
    },
    keys = { { "<leader><space>", false } },
}
