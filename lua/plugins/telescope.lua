return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            -- optional: configure defaults
            defaults = {
                layout_strategy = "flex",
                sorting_strategy = "ascending",
            },
        })
    end,
}
