return {
    "nvim-cmp",
    opts = function(_, opts)
        table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
        vim.o.completeopt = "menuone,noselect,preview"
        opts.preselect = require("cmp").PreselectMode.None
        opts.mapping = {
            ["<CR>"] = require("cmp").mapping.disable,
            ["<Tab>"] = require("cmp").mapping.disable,
            ["<m-enter>"] = require("cmp").mapping.confirm(),
            ["<c-space>"] = require("cmp").mapping.complete(),
            ["<down>"] = require("cmp").mapping.select_next_item(),
            ["<up>"] = require("cmp").mapping.select_prev_item(),
        }
        return opts
    end,
}
