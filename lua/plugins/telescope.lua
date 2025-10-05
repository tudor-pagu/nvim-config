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

        -- Keymap: <leader><leader> -> git_files()
        vim.keymap.set("n", "<leader><leader>", function()
            local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
            if vim.v.shell_error ~= 0 then
                git_root = vim.loop.cwd()
            end
            builtin.git_files({ show_untracked = true, cwd = git_root })
        end, { desc = "Find Git-tracked files (repo root)" })
    end,
}
